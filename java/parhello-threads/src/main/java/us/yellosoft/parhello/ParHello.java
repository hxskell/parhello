package us.yellosoft.parhello;

/**
   <p>Hello World in parallel</p>
*/
public final class ParHello {
  /** Utility class */
  private ParHello() {}

  /**
     <p>Actor for printing individual characters</p>
  */
  private static class CharPrinter implements Runnable {
    private char c;

    /**
       <p>Construct a printer actor.</p>
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

  /**
     <p>Main app</p>
     @param args CLI arguments
  */
  public static void main(final String[] args) {
    String message = "Hello World!\n";

    for (char c : message.toCharArray()) {
      new Thread(new CharPrinter(c)).start();
    }
  }
}
