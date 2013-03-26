functor
import
  System
  Application
  OS
define
  Children=
  {Map
   "Hello World!\n"
   fun {$ C}
     thread
       {Delay ({OS.rand} mod 2)}
       {System.printInfo ""#[C]}
       unit
     end
   end
  }

  {ForAll Children Wait}
  {Application.exit 0}
end