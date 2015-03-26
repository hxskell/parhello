# parhello in Java

# REQUIREMENTS

* [JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html) 1.6+
* [Maven](http://maven.apache.org/) 3+
* [Hadoop](http://hadoop.apache.org/) 1.2.1

E.g.: `brew install maven hadoop`

# EXAMPLE

```
$ mvn package
$ rm -rf output/
$ hadoop jar target/parhello-0.0.0.jar us.yellosoft.parhello.Append resources/greetings/ output/
$ cat output/part-00000
	!HdlroWolle
```
