/** Hello World in parallel */
public final class ParHello {
  /** Actor */
  private static class CharPrinter implements Runnable {
    private char c;

    /**
       <p>Construct actor</p>
       @param c character to print
    */
    public CharPrinter(final char c) {
      this.c = c;
    }

    /** Act */
    public void run() {
      System.out.print(c);
    }
  }

  /** utility class */
  private ParHello() {}

  /**
     <p>Main app</p>
     @param args CLI arguments
  */
  public static void main(final String[] args) {
    String message = "Hello World!\n";

    for (char c:message.toCharArray()) {
      new Thread(new CharPrinter(c)).start();
    }
  }
}
