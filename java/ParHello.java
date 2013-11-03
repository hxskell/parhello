public final class ParHello {
  private static class CharPrinter implements Runnable {
    private char c;

    public CharPrinter(final char c) {
      this.c = c;
    }

    public void run() {
      System.out.print(c);
    }
  }

  private ParHello() {}

  public static void main(final String[] args) {
    String message = "Hello World!\n";

    for (char c:message.toCharArray()) {
      new Thread(new CharPrinter(c)).start();
    }
  }
}
