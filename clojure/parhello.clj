":";exec clj -m `basename $0 .clj` ${1+"$@"}
":";exit

; Load:
;
; clj parhello.clj
;
; Interpret:
;
; ./parhello.clj <name>
; clj -m parhello <name>
;
; Compile:
;
; clj
; => (set! *compile-path* ".")
; => (compile 'parhello)
;
; Run:
;
; java -cp ~/path/to/clojure.jar:. parhello

(ns parhello
  (:gen-class))

(defn -main [& args]
    (doall (pmap print "Hello World!\n")))