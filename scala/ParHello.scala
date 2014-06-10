object ParHello {
  def main(args: Array[String]) : Unit = "Hello World!\n".par.map(print)
}
