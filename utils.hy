
(require [hy.contrib.walk [let]])

"
 Print and redirect an argument for debugging purpose.
"
(defn printre [arg]
  (do (print arg) arg))

"
 Convert symbol list to string list
"
(defmacro sym2str [symbols]
 `(lfor s '~symbols (str s)))

"
 Macro defmain with args that python's getopt parsed.
"
(defmacro defmain-getopt [s l lout &rest body]
 `(defmain [&rest args]
    (import getopt)
    (let [ls (sym2str ~s)
          ll (sym2str ~l)
          opt (.getopt getopt (cut args 1) (.join "" ls) ll)]
      ((fn [~@lout] ~@body) (dict (get opt 0)) #* (get opt 1)))))

"
 Shell macro that wraps subprocess
"
(defmacro $ [&rest cmd]
 `(do
    (let [cmdlist (sym2str ~cmd)]
      (import subprocess)
      (.check_output subprocess (.join " " cmdlist) :shell True))))

