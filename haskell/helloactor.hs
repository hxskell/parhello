#!/usr/bin/env runhaskell

-- Andrew Pennebaker

import Control.Concurrent
import Control.Monad

data Msg
	= Chr Char
	| Exit
	deriving (Eq, Show)

helloActor :: Chan Msg -> IO ()
helloActor chan = do
	msg <- readChan chan

	case msg of
		Chr c -> do
			threadDelay 10000 -- us

			putChar c
			helloActor chan
		Exit -> return ()

main :: IO ()
main = do
	let s = "Hello World!\n"

	chans <- replicateM (length s) newChan

	mapM_ (forkIO . helloActor) chans
	zipWithM (\chan c -> writeChan chan (Chr c)) chans s

	threadDelay 20000 -- us

	mapM_ (flip writeChan Exit) chans