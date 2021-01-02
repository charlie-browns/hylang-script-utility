
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

  (test/eq (printre "Test result:")
           "Test result:")

  (test/eq ($ pwd)
           (+ (os.getcwd) "\n"))

  (test/eq (p/join "hello" "world")
           "hello/world")

  (test/eq (p/abs "./test.hy")
           (os.path.abspath "./test.hy"))

  (test/eq (p/rel "./test.hy" :start "./test")
           (os.path.relpath "./test.hy" :start "./test"))

  (test/eq (p/norm ".//.//.///test//.//") 
           "test")

  (test/eq (p/real "./test/sub_0/symlink_to_test.hy")
           (os.path.realpath "./test.hy"))

  (for-dir "./test" root file-name
    (let [match (re.search "\./test/sub_\d/\w+\..+" (p/join root file-name))]
      (test/neq match None)))

  (print "ALL OK"))


