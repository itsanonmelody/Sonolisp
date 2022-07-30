(in-package :cc.aquarne.sonolisp/test)

;;;; TODO: actually write some unit tests

(def-suite* node-test-suite
  :description "Tests all node definition related facilites."
  :in main-test-suite)

(test clear-nodes-test
  ;; Fake the values of *value-nodes* and *function-nodes*
  ;; by dynamically rebinding values to them.
  (flet ((create-non-empty-hash-table ()
           (let ((table (make-hash-table)))
             (setf (gethash "key" table) "value")
             table)))
    (let ((sl::*value-nodes* '(1 2 3))
          (sl::*function-nodes* (create-non-empty-hash-table)))
      (sl:clear-nodes)
      
      (is (null sl::*value-nodes*))

      (is (hash-table-p sl::*function-nodes*))
      (is (eql (hash-table-count sl::*function-nodes*) 0)))))
