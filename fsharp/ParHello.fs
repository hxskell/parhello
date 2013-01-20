namespace ParHello

open System.Threading.Tasks

module ParHello =
    let main =
        let s = "Hello World!\n"
        Parallel.For(0, String.length s, (fun i -> printf "%c" s.[i]))