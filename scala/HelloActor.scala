import scala.actors.Actor

case class Show(v : Char)

class HActor extends Actor {
  def act = receive {
    case Show(c) => print(c)
  }
}

object HelloActor {
  def main(args : Array[String]) {
    val s = "Hello World!\n"

    val as : Seq[HActor] = s.map { _ => new HActor }
    as.map(_.start)

    (as, s).zipped map (_ ! Show(_))
  }
}
