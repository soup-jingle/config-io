;;;; config-reader.lisp

(in-package #:config-io)

(defun read-config (filename)
  "Reads an plist from the file 'filename' and returns that plist. No use of any global variables. Returns NIL if 'filename' does not exist"
  (with-open-file (stream filename
			  :direction :input
			  :if-does-not-exist nil)
    (if stream
	(read stream))))


(defun write-config (config filename)
  ""
  (with-open-file (stream filename
			  :direction :output
			  :if-does-not-exist :create)
    (format stream config)))


(defmacro set-values (config &rest key-values)
  "Sets values from plist 'config' to variables from 'key-values.' 'key-values' should be of the form ':key value' where ':key' will be used to fetch the value from 'config' to which to set the variable 'value.' It is best if each 'value' is defined beforehand (e.g. through \"DEFVAR\")"
  `(map nil #'eval
	(loop for (key val)
	      on ',key-values
	      by #'cddr
	      collect (list 'setq val
			    (getf ,config key)))))

(defun change-config (config key value)
  "Simple function to change a single value in the config plist. If the property 'key' is not already present in 'config' it will be added."
  (setf (getf config key) value)
  config)
