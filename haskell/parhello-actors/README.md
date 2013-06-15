# Cloud Haskell Actors

# REQUIREMENTS

* [Haskell](http://www.haskell.org/)
* [distributed-process](http://hackage.haskell.org/package/distributed-process)
* [distributed-process-simplelocalnet](http://hackage.haskell.org/package/distributed-process-simplelocalnet)

# EXAMPLE

    $ cabal install distributed-process distributed-process-simplelocalnet
    $ make
    killall parhello
    ./parhello speaker localhost 8081 &
    ./parhello speaker localhost 8082 &
    ./parhello master localhost 8080
    Sat Jun 15 21:28:30 UTC 2013 pid://localhost:8081:0:3: H
    Sat Jun 15 21:28:30 UTC 2013 pid://localhost:8081:0:3: e
    Sat Jun 15 21:28:30 UTC 2013 pid://localhost:8081:0:3: l
    Sat Jun 15 21:28:30 UTC 2013 pid://localhost:8081:0:3: l
    Sat Jun 15 21:28:30 UTC 2013 pid://localhost:8081:0:3: o
    Sat Jun 15 21:28:30 UTC 2013 pid://localhost:8081:0:3:  
    Sat Jun 15 21:28:30 UTC 2013 pid://localhost:8081:0:3: W
    Sat Jun 15 21:28:30 UTC 2013 pid://localhost:8081:0:3: o
    Sat Jun 15 21:28:30 UTC 2013 pid://localhost:8081:0:3: l
    Sat Jun 15 21:28:30 UTC 2013 pid://localhost:8081:0:3: !
    Sat Jun 15 21:28:30 UTC 2013 pid://localhost:8082:0:3: r
    Sat Jun 15 21:28:30 UTC 2013 pid://localhost:8082:0:3: d
