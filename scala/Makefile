all: test

test: testparhello testhelloactor

testparhello: ParHello.class
	scala ParHello

testhelloactor: HelloActor.class
	scala HelloActor

ParHello.class: ParHello.scala
	scalac ParHello.scala

HelloActor.class: HelloActor.scala
	scalac HelloActor.scala

clean:
	-rm *.class