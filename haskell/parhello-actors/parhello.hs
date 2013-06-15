#!/usr/bin/env runhaskell

{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

import Control.Distributed.Process
import Control.Distributed.Process.Node (initRemoteTable, runProcess)
import Control.Distributed.Process.Backend.SimpleLocalnet (Backend, startMaster, initializeBackend, newLocalNode, terminateAllSlaves, findPeers)

import Control.Concurrent (threadDelay)

import Data.Binary (Binary)
import Data.Typeable (Typeable)

import System.Environment (getArgs)

newtype Speaker = Speaker ProcessId deriving (Typeable, Binary)
newtype Say = Say Char deriving (Typeable, Binary)

speaker :: Maybe ProcessId -> Process ()
speaker Nothing = do
  say "waiting for master to connect"

  masterPid <- whereis "master"

  case masterPid of
    Just masterPid' -> speaker (Just masterPid')
    _ -> do
      liftIO (threadDelay 1000000) -- us
      speaker Nothing

speaker (Just masterPid') = do
  say "waiting for instructions for master"

  speakerPid <- getSelfPid

  send masterPid' (Speaker speakerPid)

  receiveWait [
    match (\(Say c) -> do
              say "got work"

              say (c:[])
              speaker (Just masterPid'))
    ]

master :: Bool -> String -> Backend -> [NodeId] -> Process ()
master False message backend _ = do
  say "registering"

  masterPid' <- getSelfPid
  register "master" masterPid'

  peers <- liftIO $ findPeers backend 20000 -- ms

  say $ "peers: " ++ show peers

  mapM (\peer -> do
           say $ "registering with peer " ++ show peer
           registerRemoteAsync peer "master" masterPid'
       ) peers

  -- receiveWait [
  --   match (\(RegisterReply s b) -> do
  --             say s
  --             say (show b))
  --   ]


  master True message backend []
master True "" backend _ = terminateAllSlaves backend
master True (c:cs) backend _ = do
  say "master loop"

  say "waiting for workers to request work"

  receiveWait [
    match (\(Speaker s) -> do
              say "speaker requesting work"

              send s (Say c)
              master True cs backend [])
    ]

main :: IO ()
main = do
  args <- getArgs

  case args of
    ["master", host, port] -> do
      backend <- initializeBackend host port initRemoteTable
      let message = "Hello World!"
      startMaster backend (master False message backend)
    ["speaker", host, port] -> do
      backend <- initializeBackend host port initRemoteTable
      node <- newLocalNode backend
      runProcess node (speaker Nothing)
