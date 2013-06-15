#!/usr/bin/env runhaskell

{-# LANGUAGE ScopedTypeVariables #-}

import Control.Distributed.Process
import Control.Distributed.Process.Node (initRemoteTable, runProcess)
import Control.Distributed.Process.Backend.SimpleLocalnet

import Data.Maybe
import System.Environment (getArgs)

data ImTheCounter = ImTheCounter NodeId
data ImTheMaster = ImTheMaster NodeId
data Say = Say Char
data Done = Done
data Dec = Dec

counter :: (Maybe NodeId) -> Int -> [NodeId] -> Process ()
counter Nothing n _ = receiveWait [
  match (\(ImTheMaster masterNid') -> do
    counterNid <- getSelfNode
    send masterNid' (ImTheCounter counterNid)
    counter (Just masterNid') n)
  ]
counter (Just masterNid') 0 _ = send masterNid' Done
counter masterNid n _ = receiveWait [
  match (\Dec -> counter masterNid (n-1) [])
  ]

speaker :: NodeId -> [NodeId] -> Process ()
speaker counterNid _ = do
  receiveWait [
    match (\(Say c) -> do
      say (c:[])
      send counterNid Dec
      speaker counterNid [])
    ]

message :: String
message = "Hello World!"

done :: Int
done = length message

master :: Backend -> [NodeId] -> Process ()
master backend workers = do
  masterNid <- getSelfNode

  -- Find the counter
  mapM (\worker -> send worker (ImTheMaster masterNid)) workers
  receiveWait [
    match (\(ImTheCounter counterNid) -> do
       -- Inform the speakers
       let speakers = workers - [counterNid]
       mapM (\(speaker,c) -> send speaker c) $ zip (cycle speakers) message

       -- Wait for count
       receiveWait [
         match (\Done -> terminateAllSlaves backend)
         ])
    ]

main :: IO ()
main = do
  args <- getArgs

  case args of
    ["master", host, port] -> do
      backend <- initializeBackend host port initRemoteTable
      startMaster backend (master backend)
    ["speaker", host, port] -> do
      backend <- initializeBackend host port initRemoteTable
      node <- newLocalNode backend
      runProcess node speaker
    ["counter", host, port] -> do
      backend <- initializeBackend host port initRemoteTable
      node <- newLocalNode backend
      runProcess node (counter Nothing done)
