functor
import
  System
  Application
  OS
define
 {OS.srand 0}

  Children=
  {Map
   "Hello World!\n"
   fun {$ C}
     thread
       {Delay ({OS.rand} mod 2)}
       {System.printInfo ""#[C]}
       nil
     end
   end
  }

  {Wait Children}
  {Application.exit 0}
end