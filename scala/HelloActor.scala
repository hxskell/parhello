// Parallel Hello World using actors

import scala.actors.Actor
import scala.actors.Actor._

case class Store(v : Char)
case class Show()

class HActor extends Actor {
	var c : Char = ' ';

	def act() = {
		while (true) {
			receive {
				case Store(v) => c = v
				case Show() => print(c)
			}
		}
	}
}

object HelloActor {
	def main(args : Array[String]) {
		val s = "Hello World!"

		val as : Seq[HActor] = s.map { _ => new HActor }

		(as, s).zipped map (_ ! Store(_))
		as.map (_ ! Show())

		Thread.sleep(10)
	}
}