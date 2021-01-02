
(import [src.utils [*]])
(import re)
(require [src.utils [*]])
(require [hy.contrib.walk [let]])

;; Test defmain-getopt itself.
;;
;; Try the command below:
;; $ hy test.hy -a -b shortoptarg --longoption --longoption-with-arg=longoptarg subcommand1 subcommand2
(defmain-getopt (a b:) 
                (longoption longoption-with-arg=)
                [optdict &rest comlist]

  (assert/= (printre "Test result:")
            "Test result:")

  (assert/= ($ pwd)
            (+ (os.getcwd) "\n"))

  (assert/= (p/join "hello" "world")
            "hello/world")

  (assert/= (p/abs "./test.hy")
            (os.path.abspath "./test.hy"))

  (assert/= (p/rel "./test.hy" :start "./test")
            (os.path.relpath "./test.hy" :start "./test"))

  (assert/= (p/norm ".//.//.///test//.//") 
            "test")

  (assert/= (p/real "./test/sub_0/symlink_to_test.hy")
            (os.path.realpath "./test.hy"))

  (for-dir "./test" root file-name
    (let [match (re.search "\./test/sub_\d/\w+\..+" (p/join root file-name))]
      (assert/!= match None)))

  (print "ALL OK"))


