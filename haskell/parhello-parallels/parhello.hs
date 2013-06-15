#!/usr/bin/env runhaskell

-- Andrew Pennebaker

import Control.Concurrent.ParallelIO.Global
import System.IO

main = do
  -- By default, buffering prevents some IO nondeterminism
  hSetBuffering stdout NoBuffering

  parallel_ $ map putChar "Hello World!"

  stopGlobalPool
