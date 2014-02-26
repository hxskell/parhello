#!/usr/bin/env runhaskell

{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

import Control.Distributed.Process (
  Process,
  ProcessId,
  NodeId,
  getSelfPid,
  register,
  registerRemoteAsync,
  whereis,
  send,
  say,
  receiveWait,
  match,
  liftIO,
  )
import Control.Distributed.Process.Node (initRemoteTable, runProcess)
import Control.Distributed.Process.Backend.SimpleLocalnet (
  Backend,
  startMaster,
  initializeBackend,
  newLocalNode,
  terminateAllSlaves,
  findPeers
  )

import Control.Concurrent (threadDelay)

import Data.Binary (Binary)
import Data.Typeable (Typeable)

import System.Environment (getArgs)

newtype Speaker = Speaker ProcessId deriving (Typeable, Binary)
newtype Say = Say Char deriving (Typeable, Binary)

speaker :: Maybe ProcessId -> Process ()
speaker Nothing = do
  masterPid <- whereis "master"

  case masterPid of
    Just masterPid' -> speaker (Just masterPid')
    _ -> do
      liftIO (threadDelay 1000000) -- us
      speaker Nothing

speaker (Just masterPid') = do
  speakerPid <- getSelfPid
  send masterPid' (Speaker speakerPid)
  receiveWait [
    match (\(Say c) -> do
              say (c:[])
              speaker (Just masterPid'))
    ]

master :: Bool -> String -> Backend -> [NodeId] -> Process ()
master False message backend _ = do
  masterPid' <- getSelfPid
  register "master" masterPid'

  peers <- liftIO $ findPeers backend 20000 -- ms
  mapM_ (\peer -> registerRemoteAsync peer "master" masterPid') peers

  master True message backend []
master True "" backend _ = terminateAllSlaves backend
master True (c:cs) backend _ = do
  receiveWait [
    match (\(Speaker s) -> do
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
    _ -> return ()
