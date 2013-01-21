#!/usr/bin/env runhaskell

-- Andrew Pennebaker

import Control.Concurrent

data Msg
	= Chr Char
	| Exit
	deriving (Eq, Show)

helloActor :: Chan Msg -> IO ()
helloActor chan = do
	msg <- readChan chan

	case msg of
		Chr c -> do
			threadDelay 1000 -- ms

			putChar c
			helloActor chan
		Exit -> return ()

main :: IO ()
main = do
	let s = "Hello World!\n"

	chans <- replicate (length s) newChan

	mapM_ (forkIO helloActor) chans
	zipWith (chans, s) (\(chan, c) -> writeChan chan c)
	mapM_ (writeChan Exit) chans