#!/usr/bin/env runhaskell

{-# LANGUAGE ScopedTypeVariables #-}

import Control.Distributed.Process
import Control.Distributed.Process.Node (initRemoteTable, runProcess)
import Control.Distributed.Process.Backend.SimpleLocalnet

import Data.Maybe
import System.Environment (getArgs)

data ImTheCounter = ImTheCounter ProcessId
data ImTheMaster = ImTheMaster ProcessId
data Say = Say Char
data Done = Done
data Dec = Dec

counter :: (Maybe ProcessId) -> Int -> [NodeId] -> Process ()
counter Nothing n _ = receiveWait [
  match (\(ImTheMaster masterPid') -> do
    counterPid <- getSelfPid
    send masterPid' (ImTheCounter counterPid)
    counter (Just masterPid') n [])
  ]
counter (Just masterPid') 0 _ = send masterPid' Done
counter masterPid n _ = receiveWait [
  match (\Dec -> counter masterPid (n-1) [])
  ]

speaker :: ProcessId -> [NodeId] -> Process ()
speaker counterPid _ = do
  receiveWait [
    match (\(Say c) -> do
      say (c:[])
      send counterPid Dec
      speaker counterPid [])
    ]

message :: String
message = "Hello World!"

done :: Int
done = length message

master :: Backend -> [NodeId] -> Process ()
master backend workers = do
  masterPid <- getSelfPid

  -- Find the counter
  mapM (\worker -> send worker (ImTheMaster masterPid)) workers
  receiveWait [
    match (\(ImTheCounter counterPid) -> do
       -- Inform the speakers
       let speakers = workers - [counterPid]
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
      runProcess node (counter Nothing done [])
