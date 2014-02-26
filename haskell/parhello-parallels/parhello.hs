#!/usr/bin/env runhaskell

-- Andrew Pennebaker

import Control.Concurrent.ParallelIO.Global (parallel_, stopGlobalPool)
import System.IO (
  BufferMode(NoBuffering),
  stdout,
  hSetBuffering
  )

main :: IO ()
main = do
  -- By default, buffering prevents some IO nondeterminism
  hSetBuffering stdout NoBuffering

  parallel_ $ map putChar "Hello World!"

  stopGlobalPool
