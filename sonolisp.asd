(asdf:defsystem "sonolisp"
  :author "David Bryan"
  :description "A Sonolus scripting library for Common Lisp"
  :version "0.1.0"
  :license "MIT"
  :depends-on ("cl-json")
  :components ((:module "src"
                :serial t
                :components
                ((:file "packages")
                 (:file "engine")
                 (:file "node")
                 (:module "nodes"
                  :components
                  ((:file "block")
                   (:file "clip")
                   (:file "control")
                   (:file "debug")
                   (:file "entity")
                   (:file "logic")
                   (:file "math")
                   (:file "particle")
                   (:file "random")
                   (:file "sprite")))))))
