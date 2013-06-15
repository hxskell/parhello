#!/usr/bin/env runhaskell

{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

import Control.Distributed.Process
import Control.Distributed.Process.Node (initRemoteTable, runProcess)
import Control.Distributed.Process.Backend.SimpleLocalnet (Backend, startMaster, initializeBackend, newLocalNode, terminateAllSlaves)

import Data.Binary (Binary)
import Data.Typeable (Typeable)

import System.Environment (getArgs)

newtype Speaker = Speaker ProcessId deriving (Typeable, Binary)
newtype Say = Say Char deriving (Typeable, Binary)

speaker :: Process ()
speaker = do
  speakerPid <- getSelfPid
  nsend "master" (Speaker speakerPid)
  receiveWait [
    match (\(Say c) -> do
              say (c:[])
              speaker)
    ]

master :: String -> Backend -> [NodeId] -> Process ()
master "" backend _ = terminateAllSlaves backend
master (c:cs) backend _ = receiveWait [
  match (\(Speaker s) -> do
            send s (Say c)
            master cs backend [])
  ]

main :: IO ()
main = do
  args <- getArgs

  case args of
    ["master", host, port] -> do
      backend <- initializeBackend host port initRemoteTable
      let message = "Hello World!"
      startMaster backend (master message backend)
    ["speaker", host, port] -> do
      backend <- initializeBackend host port initRemoteTable
      node <- newLocalNode backend
      runProcess node speaker
