// Parallel Hello World using actors

import scala.actors.Actor
import scala.actors.Actor._

case class Store(v : Char)
case class Show()

object HelloActor extends Actor {
	var c : Char = ' ';

	def act() = {
		while (true) {
			receive {
				case Store(v) => c = v
				case Show() => print(c)
			}
		}
	}

	def main(args : Array[String]) {
		val s = "Hello World!"

		val as : Array[HelloActor] = new Array[HelloActor](s.length)

		for (i <- 0 until s.length() - 1) {
			as(i) ! Store(s(i))
			as(i) ! Show()
		}
	}
}