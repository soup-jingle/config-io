;;;; package.lisp

(defpackage #:config-io
  (:use #:cl)
  (:export
   :read-config
   :write-config
   :set-values
   :change-config))
