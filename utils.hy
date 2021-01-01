
(require [hy.contrib.walk [let]])

"
 Print and redirect an argument for debugging purpose.
"
(defn printre [arg]
  (do (print arg) arg))

"
 Convert symbol list to string list
"
(defmacro sym2str [sym]
 `(lfor s '~sym (str s)))

"
 Macro defmain with args that python's getopt parsed.
"
(defmacro defmain-getopt [s l lout &rest body]
 `(defmain [&rest args]
    (import getopt)
    (let [opt (getopt.getopt 
                (cut args 1)
                (.join "" (sym2str ~s))
                (sym2str ~l))]
      ((fn [~@lout] ~@body)
        (dict (get opt 0)) #* (get opt 1)))))

"
 Shell macro that wraps subprocess
"
(defmacro $ [&rest cmd]
 `(do
    (let [cmdlist (sym2str ~cmd)]
      (import subprocess)
      (subprocess.check_output 
        (.join " " cmdlist)
        :shell True))))

