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

lint: scalaclint

scalaclint:
	for s in *.scala; do scalac -Xlint -deprecation $$s; done

clean:
	-rm *.class
