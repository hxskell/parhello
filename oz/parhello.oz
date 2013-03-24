functor
import
  System
  Application
  OS
define
  fun {ParForEach Xs P}
    case Xs
    of nil then nil
    [] X|Xr then thread {P X} nil end |{ParForEach Xr P}
    end
  end

  {OS.srand 0}

  _=
  {ParForEach
   "Hello World!\n"
   proc {$ C}
     {Delay ({OS.rand} mod 2)}
     {System.printInfo ""#[C]}
   end
  }

  {Application.exit 0}
end