all: test

test: ParHello.class
	scala ParHello

ParHello.class: ParHello.scala
	scalac ParHello.scala

clean:
	-rm *.class