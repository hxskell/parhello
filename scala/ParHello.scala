object ParHello {
  def main(args: Array[String]) {
    "Hello World!\n".par.map(print)
  }
}
