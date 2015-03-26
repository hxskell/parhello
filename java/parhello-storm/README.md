# parhello in Java

# REQUIREMENTS

* [JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html) 6+
* [Maven](http://maven.apache.org/) 3+
* [Storm](https://storm.apache.org/) 0.9.3+

E.g.: `brew install maven storm`

# EXAMPLE

Starting with a lot of text in an input directory:

```
$ tree resources/sherlock-holmes/
resources/sherlock-holmes/
├── agrange.txt
├── b-p_plan.txt
├── bascombe.txt
├── beryl.txt
├── blanced.txt
├── blkpeter.txt
├── bluecar.txt
├── cardbox.txt
├── caseide.txt
├── charles.txt
├── copper.txt
├── creeping.txt
├── crookman.txt
├── danceman.txt
├── devilsf.txt
├── doyle-adventures-380.txt
...
```

We write a Storm topology to divide up the work for counting words.

```
$ tail -n 14 src/main/java/us/yellosoft/storm/tutorial/WordCountTopology.java 
  public static void main(String[] args) throws Exception {
    TopologyBuilder builder = new TopologyBuilder();
    builder.setSpout("text-spout", new TextSpout(), 1);
    builder.setBolt("word-splitter", new WordSplitter(), 4).shuffleGrouping("text-spout");
    builder.setBolt("word-counter", new WordCount(), 8).fieldsGrouping("word-splitter", new Fields("word"));

    Config config = new Config();
    config.setDebug(true);
    config.setMaxTaskParallelism(3);

    LocalCluster cluster = new LocalCluster();
    cluster.submitTopology("word-count", config, builder.createTopology());
  }
}
```

We compile and run the job,

```
$ mvn package
$ storm jar target/parhello-0.0.0.jar us.yellosoft.parhello.HelloTopology
...
69856 [Thread-10-word-counter] INFO  backtype.storm.daemon.task - Emitting: word-counter default [pointed, 22]
...
Control+C
```
