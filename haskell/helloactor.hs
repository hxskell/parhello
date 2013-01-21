#!/usr/bin/env runhaskell

import Control.Concurrent
import Control.Monad

data Msg = Chr Char | Exit deriving (Eq, Show)

type Actor a = Chan a -> IO ()

startActor :: Actor a -> Chan a -> IO ThreadId
startActor actor chan = forkIO (actor chan)

send :: Actor a -> a -> IO ()
send = writeChan

receive :: Chan a -> IO a
receive = readChan

helloActor :: Actor Msg
helloActor chan = do
	msg <- receive chan

	case msg of
		Chr c -> do
			putChar c
			helloActor chan
		Exit -> return ()

main :: IO ()
main = do
	let s = "Hello World!\n"

	chans <- replicateM (length s) newChan
	mapM_ (startActor . helloActor) chans
	zipWithM (\chan c -> send chan (Chr c)) chans s

	threadDelay 20000 -- us

	mapM_ (flip writeChan Exit) chans