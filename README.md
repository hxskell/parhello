# parhello - Hello World in a variety of parallel processing languages

# EXAMPLE

```
$ cd haskell/parhello-parallels/
$ make
mkdir -p bin/
ghc -O2 -Wall -fwarn-tabs --make -fforce-recomp -o bin/parhello -main-is ParHello ParHello.hs -threaded -package parallel-io
[1 of 1] Compiling ParHello         ( ParHello.hs, ParHello.o )
Linking bin/parhello ...
bin/parhello +RTS -N
le llH!oo
```
