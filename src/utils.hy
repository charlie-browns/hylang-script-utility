
(require [hy.contrib.walk [let]])
(import os
        getopt
        subprocess)

"
 Print and redirect an argument for debugging purpose.
"
(defn printre [arg]
  (do (print arg) arg))

"
 Wrap assert for test
"
(defn test/eq [arg1 arg2]
  (assert (= arg1 arg2)))

(defn test/neq [arg1 arg2]
  (assert (!= arg1 arg2)))

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
      (-> (subprocess.check_output 
        (.join " " cmdlist) :shell True) (.decode)))))

"
 Walk given dir to do something for files in it
"
(defmacro for-dir [path-to-dir name-of-root-path name-of-file-path &rest body]
 `(for [[root dirs files] (os.walk ~path-to-dir)]
    (for [f files]
      ((fn [~name-of-root-path ~name-of-file-path] ~@body) root f))))

"
 Wrappers for os.path
"
(defn p/join [path &rest paths]
  (os.path.join path #* paths))

(defn p/abs [path]
  (os.path.abspath path))

(defn p/rel [path &optional [start os.curdir]]
  (os.path.relpath path :start start))

(defn p/norm [path]
  (os.path.normpath path))

(defn p/real [path]
  (os.path.realpath path))
