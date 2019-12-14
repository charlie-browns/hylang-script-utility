
(require [utils [*]])

;; Test defmain-getopt itself.
;;
;; Try the command below:
;; $ hy test.hy -a -b shortoptarg --longoption --longoption-with-arg=longoptarg subcommand1 subcommand2
(defmain-getopt (a b:) 
                (longoption longoption-with-arg=)
                [optdict &rest comlist]
  (print "")

  (print "Parsed options :")
  (print optdict "\n")

  (print "Parsed sub commands :")
  (print comlist "\n")

  ;; Test $ macro
  (print "Show your cpu model name :")
  (print ($ lscpu | grep -iP "model.*name")))


