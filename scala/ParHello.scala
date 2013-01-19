object ParHello {
	def hello(c: Char) {
		print(c)
	}

	def main(args: Array[String]) {
		"Hello World!".par.map(hello)
	}
}