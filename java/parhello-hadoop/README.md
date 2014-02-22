# parhello in Java

# REQUIREMENTS

* [Maven](http://maven.apache.org/) 3+
* [Hadoop](http://hadoop.apache.org/) 1.2.1

Example: `brew install maven hadoop`

# EXAMPLE

```
$ mvn package
$ hadoop jar target/parhello-0.0.0.jar us.yellosoft.parhello.Append resources/greetings/ output/
$ cat output/part-00000
  !HdlroWolle
```
