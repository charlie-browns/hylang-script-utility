
(import [utils [*]])
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

  (print "Test $ macro :")
  (print ($ lscpu | grep -iP "model.*name"))  ;; Show your cpu model name.
  
  (print "Test printre :")
  (printre "This will be shown once.")
  (print (printre "This will be shown twice."))
  (print "")

  (print "Test p/join :")
  (print (p/join "hello" "world"))

  (print "Test p/abs :")
  (print (p/abs "./"))

  (print "Test p/rel :")
  (print (p/rel "./" :start "/usr/local"))

  (print "Test p/norm :")
  (print (p/norm ".///////.git"))

  (print "Test p/real :")
  (print (p/real "./sym_link_test.c"))

  (print "Test for-dir ---------------------------------------------------")
  (for-dir "./" root-path file-name
    (print (p/join root-path file-name)))
  (print "end Test for-dir -----------------------------------------------")
 )


