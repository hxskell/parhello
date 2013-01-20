object ParHello {
	def main(args: Array[String]) {
		"Hello World!".par.map(print)
	}
}