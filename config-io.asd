;;;; config-reader.asd

(defsystem "config-io"
  :description "A simple library to read config files (which are simple an S-exp)"
  :author "Patrick Bunetic <soup-jingle@protonmail.com>"
  :license "LLGPL"
  :version "1.0.0"
  :serial t
  :components ((:module "src"
		:components
		((:file "package")
		 (:file "config-io")))))
