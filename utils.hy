
(require [hy.contrib.walk [let]])

"
 Print and redirect an argument for debugging purpose.
"
(defn printre [arg]
  (do (print arg) arg))

"
 Convert symbol list to string list
"
(defmacro symbols-to-strings [symbols]
 `(lfor s '~symbols (str s)))

"
 Macro defmain with args that python's getopt parsed.
"
(defmacro defmain-getopt [s l lout &rest body]
 `(defmain [&rest args]
   (import getopt)
   (setv ls (symbols-to-strings ~s)
         ll (symbols-to-strings ~l)
         opt (.getopt getopt (cut args 1) (.join "" ls) ll))
   ((fn [~@lout] ~@body) (dict (get opt 0)) #* (get opt 1))))

"
 Shell macro that wraps subprocess
"
(defmacro $ [&rest cmd]
 `(do
   (import subprocess)
   (setv cmdlist (symbols-to-strings ~cmd))
   (try
    (setv output (.check_output subprocess (.join " " cmdlist) :shell True))
    (except [subprocess.SubprocessError]
     "")
    (else
     (.decode output "utf-8")))))

