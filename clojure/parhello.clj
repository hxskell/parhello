":";exec lein exec $0 ${1+"$@"}

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

(when (.contains (first *command-line-args*) *source-path*)
  (apply -main (rest *command-line-args*)))
