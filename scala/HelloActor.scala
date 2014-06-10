import akka.actor.{ Actor, ActorRef, ActorSystem, Props }

case class Show(v : Char)

class HActor extends Actor {
  def receive = {
    case Show(c) => print(c)
  }
}

object HelloActor {
  def main(args : Array[String]) {
    val system = ActorSystem("HelloSystem")

    val s = "Hello World!\n"

    val as : Seq[ActorRef] = s.map(c => system.actorOf(Props[HActor]))

    (as, s).zipped map ((a, c) => a ! Show(c))

    system.shutdown
  }
}
