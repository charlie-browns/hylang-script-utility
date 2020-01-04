
(import [utils [*]])
(require [utils [*]])

(defun test-defun (arg &rest args)
 (print arg)
 (print #* args)
 )

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
  
  (print "Test defun macro :")
  (test-defun "This is an arg ." "This" "is" "a" "rest" "arg" ".")
  (print "")

  (print "Test printre :")
  (printre "This will be shown once.")
  (print (printre "This will be shown twice."))
  (print "")
 )


