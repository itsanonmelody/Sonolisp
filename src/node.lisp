(in-package cc.aquarne.sonolisp)

(defvar *value-nodes* ())
(defvar *function-nodes* (make-hash-table :test #'equal))

(defun clear-nodes ()
  (setf *function-nodes* (make-hash-table))
  (setf *value-nodes* ()))

(defun map-node-to-index ()
  (let ((index-map (make-hash-table))
        (current-index 0))
    (flet ((update-index-map (node)
             (setf (gethash node index-map) current-index)
             (incf current-index)))
      (loop ; function nodes
        for group being each hash-value in *function-nodes*
        do (loop
             for node in group
             do (update-index-map node)))
      (loop ; value nodes
        for node in *value-nodes*
        do (update-index-map node)))
    index-map))

(defun resolve-nodes (index-map)
  (append
    (loop ; function nodes
      for group being each hash-value in *function-nodes*
      collect (loop
                for node in group
                collect (list
                          (cons "func" (get-name node))
                          (cons "args"
                                (loop
                                  for arg-node in (get-arguments node)
                                  collect (gethash arg-node index-map)))))
      into nodes
      finally (return (apply #'append nodes)))
    (loop ; value nodes
      for node in *value-nodes*
      collect (list (cons "value" (get-value node))))))

(defun nodes-to-list ()
  "Converts all the current instantiated nodes into a single list that is parsable by cl-json."
  (resolve-nodes (map-node-to-index)))

(defclass node () ()
  (:documentation "Represents a single instance Sonolus node."))

(defclass value-node (node)
  ((value :initarg :value
          :initform (error ":value must be given!")
          :reader get-value
          :documentation "The value of the value node."))
  (:documentation "Represents an instance of a Sonolus value node."))

(defun make-value-node (value)
  (make-instance 'value-node :value value))

(defun intern-value-node (node)
  (or (find (get-value node) *value-nodes* :test #'equal :key #'get-value)
      (progn
        (push node *value-nodes*)
        node)))

(defun value-node-p (node)
  (typep node 'value-node))

(defclass function-node (node)
  ((name :initarg :name
         :initform (error ":name must be given!")
         :reader get-name
         :documentation "The name of the function node.")
   (arguments :initarg :arguments
              :initform ()
              :reader get-arguments
              :documentation "The arguments of the function node."))
  (:documentation "Represents an instance of a Sonolus function node."))

(defun make-function-node (name arguments)
  (make-instance 'function-node :name name :arguments arguments))

(defun intern-function-node (node)
  (let* ((node-name (get-name node))
         (same-nodes (gethash node-name *function-nodes*)))
    (or (find (get-arguments node) same-nodes
              :test #'equal :key #'get-arguments)
        (progn
          (push node same-nodes)
          (setf (gethash node-name *function-nodes*) same-nodes)
          node))))

(defun function-node-p (node)
  (typep node 'function-node))

(defun expand-defnode-parameters (parameters)
  (do* ((item (first parameters) (first rest))
        (rest (rest parameters) (rest rest))
        (result ()))
       ((eql item nil) `(cl:list ,@(nreverse result)))
    (cond
      ((eql item 'cl:&rest)
       (setf item (first rest))
       (let ((var (gensym))
             (res (gensym)))
         (push `(loop
                  for ,var in ,item
                  collect (cond
                            ((typep ,var 'number)
                             (intern-value-node (make-value-node ,var)))
                            ((typep ,var 'boolean)
                             (intern-value-node (make-value-node (if ,var 1 0))))
                            (t
                             ,var)))
               result))
       (return-from expand-defnode-parameters
                    `(cl:apply #'cl:list ,@(nreverse result))))
      (t
       (push (cond
               ((typep item 'number)
                (intern-value-node (make-value-node item)))
               ((typep item 'boolean)
                (intern-value-node (make-value-node (if item 1 0))))
               (t
                item))
             result)))))

(defun defnode-impl (id parameters &key (name (error "Missing 'name' argument."))
                                           ((:documentation doc) ""))
  `(defun ,id ,parameters ,doc
     (intern-function-node
       (make-function-node ,name
                           ,(expand-defnode-parameters parameters)))))

;;; TODO: expand defnode into a defmacro form.
(defmacro defnode (id (&rest parameters) &body key-args)
  (apply #'defnode-impl id parameters key-args))
