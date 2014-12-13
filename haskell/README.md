# parhello/haskell

Demonstration of parallel processing in Haskell

# EXAMPLE

```
$ cd parhello-parallels/
$ make
mkdir -p bin/
ghc -O2 -Wall -fwarn-tabs --make -fforce-recomp -o bin/parhello -main-is ParHello ParHello.hs -threaded -package parallel-io
[1 of 1] Compiling ParHello         ( ParHello.hs, ParHello.o )
Linking bin/parhello ...
bin/parhello +RTS -N
le llodorH!
```

# REQUIREMENTS

* `ghc` 7.8+

E.g., `brew install ghc`
