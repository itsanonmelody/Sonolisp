(in-package :cl-user)

(defpackage :cc.aquarne.sonolisp/test
  (:nicknames :sonolisp/test :sl/test)
  (:documentation "Unit tests for Sonolisp.")
  (:use :common-lisp
        :fiveam))
(in-package :cc.aquarne.sonolisp/test)

(def-suite main-test-suite
  :description "The top level test suite.")
