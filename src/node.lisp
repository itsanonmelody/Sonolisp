(in-package cc.aquarne.sonolisp)

(defvar *value-nodes* ())
(defvar *function-nodes* (make-hash-table :test #'equal))

(defun clear-nodes ()
  (setf *function-nodes* (make-hash-table))
  (setf *value-nodes* ()))

(defclass node () ()
  (:documentation "Represents a single instance Sonolus node."))

(defun node-p (node)
  (typep node 'node))

(defclass value-node (node)
  ((value :initarg :value
          :initform (error ":value must be given!")
          :reader get-value
          :documentation "The value of the value node."))
  (:documentation "Represents an instance of a Sonolus value node."))

(defun value-node-p (node)
  (typep node 'value-node))

(defun intern-value-node (node)
  (unless (value-node-p node)
    (error "'node' is not of type value-node!"))
  (or (find (get-value node) *value-nodes* :test #'equal :key #'get-value)
      (progn
        (push node *value-nodes*)
        node)))

(defclass function-node (node)
  ((func :initarg :func
         :initform (error ":name must be given!")
         :reader get-func
         :documentation "The name of the function node.")
   (args :initarg :args
         :initform ()
         :reader get-args
         :documentation "The arguments of the function node."))
  (:documentation "Represents an instance of a Sonolus function node."))

(defun function-node-p (node)
  (typep node 'function-node))

(defun intern-function-node (node)
  (unless (function-node-p node)
    (error "'node' is not of type function-node!"))
  (let* ((node-func (get-func node))
         (same-nodes (gethash node-func *function-nodes*)))
    (or (find (get-args node) same-nodes
              :test #'equal :key #'get-args)
        (progn
          (push node same-nodes)
          (setf (gethash node-func *function-nodes*) same-nodes)
          node))))

(defclass lambda-list-parameter ()
  ((name :initarg :name
         :initform (error ":name must be given!")
         :reader get-name
         :documentation "A symbol that represents the name of the parameter."))
  (:documentation "Represents a simple lambda list parameter."))

(defclass lambda-list-optional-parameter (lambda-list-parameter)
  ((init-form :initarg :init-form
              :initform nil
              :reader get-init-form
              :documentation "A Lisp form that is supplied to the parameter as a default value.")
   (supplied-p-name :initarg :supplied-p-name
                    :initform nil
                    :reader get-supplied-p-name
                    :documentation "A symbol that represents the name of the supplied-p variable."))
  (:documentation "Represents an optional lambda list parameter."))

(defclass lambda-list-key-parameter (lambda-list-optional-parameter)
  ((keyword-name :initarg :keyword-name
                 :initform (error ":keyword must be given!")
                 :reader get-keyword-name
                 :documentation "A symbol that represents the keyword tied to the parameter"))
  (:documentation "Represents a keyword lambda list parameter."))

(defclass lambda-list-aux-parameter (lambda-list-parameter)
  ((init-form :initarg :init-form
              :initform nil
              :reader get-init-form
              :documentation "A Lisp form that is supplied to the parameter as a default value."))
  (:documentation "Represents an aux lambda list parameter."))

(defclass lambda-list ()
  ((required-parameters :initarg :required-parameters
                        :initform nil
                        :reader get-required-parameters
                        :documentation "A list of lambda-list-parameter instances.")
   (optional-parameters :initarg :optional-parameters
                        :initform nil
                        :reader get-optional-parameters
                        :documentation "A list of lambda-list-optional-parameter instances.")
   (rest-parameter :initarg :rest-parameter
                   :initform nil
                   :reader get-rest-parameter
                   :documentation "A single instance of lambda-list-parameter.")
   (key-parameters :initarg :key-parameters
                   :initform nil
                   :reader get-key-parameters
                   :documentation "A list of lambda-list-key-parameter instances.")
   (aux-parameters :initarg :aux-parameters
                   :initform nil
                   :reader get-aux-parameters
                   :documentation "A list of lambda-list-aux-parameter instances."))
  (:documentation "Represents an ordinary lambda list."))

(defun parse-required-parameter (parameter)
  (unless (symbolp parameter)
    (error (format nil "Invalid required parameter '~a'!"
                   parameter)))
  (make-instance 'lambda-list-parameter
                 :name parameter))

(defun parse-optional-parameter (parameter)
  (cond
    ((symbolp parameter)
     (make-instance 'lambda-list-optional-parameter
                    :name parameter))
    ((and (listp parameter)
          (not (null parameter)))
     (let ((name nil)
           (init-form nil)
           (supplied-p-name nil))
       (unless (symbolp (first parameter))
         (error (format nil "Invalid optional parameter '~a'!"
                        parameter)))
       (setf name (first parameter))
       (when (rest parameter)
         (setf init-form (second parameter)))
       (when (third parameter)
         (if (symbolp (third parameter))
             (setf supplied-p-name (third parameter))
             (error (format nil "Invalid optional parameter '~a'!"
                            parameter))))
       (make-instance 'lambda-list-optional-parameter
                      :name name
                      :init-form init-form
                      :supplied-p-name supplied-p-name)))
    (t
     (error (format nil "Invalid optional parameter '~a'!"
                    parameter)))))

(defun parse-rest-parameter (parameter)
  (unless (symbolp parameter)
    (error (format nil "Invalid rest parameter '~a'!"
                   parameter)))
  (make-instance 'lambda-list-parameter
                 :name parameter))

(defun parse-key-parameter (parameter)
  (cond
    ((symbolp parameter)
     (make-instance 'lambda-list-key-parameter
                    :name parameter
                    :keyword-name (intern
                                    (symbol-name parameter)
                                    "KEYWORD")))
    ((and (listp parameter)
          (not (null parameter)))
     (let ((name nil)
           (keyword-name nil)
           (init-form nil)
           (supplied-p-name nil))
       (cond
         ((symbolp (first parameter))
          (setf name (first parameter))
          (setf keyword-name (intern
                               (symbol-name name)
                               "KEYWORD")))
         ((and (listp (first parameter))
               (not (null (first parameter))))
          (unless (and (symbolp (first (first parameter)))
                       (rest (first parameter))
                       (symbolp (second (first parameter))))
            (error (format nil "Invalid key parameter '~a'!"
                           parameter)))
          (setf name (second (first parameter)))
          (setf keyword-name (first (first parameter))))
         (t
          (error (format nil "Invalid key parameter '~a'!"
                         parameter))))
       (when (rest parameter)
         (setf init-form (second parameter)))
       (when (third parameter)
         (if (symbolp (third parameter))
             (setf supplied-p-name (third parameter))
             (error (format nil "Invalid key parameter '~a'!"
                            parameter))))
       (make-instance 'lambda-list-key-parameter
                      :name name
                      :keyword-name keyword-name
                      :init-form init-form
                      :supplied-p-name supplied-p-name)))
    (t
     (error (format nil "Invalid key parameter '~a'!"
                    parameter)))))

(defun parse-aux-parameter (parameter)
  (cond
    ((symbolp parameter)
     (make-instance 'lambda-list-aux-parameter
                    :name parameter))
    ((and (listp parameter)
          (not (null parameter)))
     (let ((name nil)
           (init-form nil))
       (unless (symbolp (first parameter))
         (error (format nil "Invalid aux parameter '~a'!"
                        parameter)))
       (setf name (first parameter))
       (when (rest parameter)
         (setf init-form (second parameter)))
       (make-instance 'lambda-list-aux-parameter
                      :name name
                      :init-form init-form)))
    (t
     (error (format nil "Invalid aux parameter '~a'!"
                    parameter)))))

(defun parse-lambda-list (parameters)
  (loop
    with required-params = () and
         optional-params = () and
         rest-param = nil and
         key-params = () and
         aux-params = ()
    with parse-param = (lambda (param)
                         (push (parse-required-parameter param) required-params))
    for param in parameters
    do (cond
         ((eql param '&optional)
          (setf parse-param
                (lambda (param)
                  (push (parse-optional-parameter param) optional-params))))
         ((eql param '&rest)
          (setf parse-param
                (lambda (param)
                  (when (null rest-param)
                    (setf rest-param
                          (parse-rest-parameter param))))))
         ((eql param '&key)
          (setf parse-param
                (lambda (param)
                  (push (parse-key-parameter param) key-params))))
         ((eql param '&allow-other-keys)) ; ignore
         ((eql param '&aux)
          (setf parse-param
                (lambda (param)
                  (push (parse-aux-parameter param) aux-params))))
         (t
          (funcall parse-param param)))
    finally
     (return
       (make-instance 'lambda-list
                      :required-parameters (reverse required-params)
                      :optional-parameters (reverse optional-params)
                      :rest-parameter rest-param
                      :key-parameters (reverse key-params)
                      :aux-parameters (reverse aux-params)))))

(defun get-argument-type (arg)
  (cond
    ((numberp arg) :number)
    ((or (eql arg t)
         (eql arg nil))
     :bool)
    ((node-p arg) :node)
    (t :unknown)))

(defun parse-argument (arg)
  (let ((type (get-argument-type arg)))
    (cond
      ((eql type :bool)
       (make-instance 'value-node
                      :value (if arg 1 0)))
      ((eql type :number)
       (make-instance 'value-node
                      :value arg))
      ((eql type :node)
       arg)
      ((eql type :unknown)
       (error "An invalid argument not of type boolean, number, or node was given!")))))

(defun expand-single-lambda-list-parameter (parameter)
  `(parse-argument ,(get-name parameter)))

(defun expand-many-lambda-list-parameter (parameter)
  (let ((item (gensym)))
    `(loop
       for ,item in ,parameter
       collect (parse-argument ,item))))

(defun expand-lambda-list (lambda-list)
  (let ((required-params (get-required-parameters lambda-list))
        (optional-params (get-optional-parameters lambda-list))
        (rest-param (get-rest-parameter lambda-list))
        (key-params (get-key-parameters lambda-list))
        (aux-params (get-aux-parameters lambda-list)))
    (if (and (not (null rest-param))
             (null key-params))
        `(append
           (list
             ,@(map 'list #'expand-single-lambda-list-parameter
                    (append
                      required-params
                      optional-params)))
           ,(expand-many-lambda-list-parameter (get-name rest-param)))
        `(list
           ,@(map 'list #'expand-single-lambda-list-parameter
                  (append
                    required-params
                    optional-params
                    key-params))))))

(defun collect-keyword-values (keyword plist)
  (loop for (key value) on plist by #'cddr
        when (eql key keyword)
        collect value))

(defun expand-check-form (check-form)
  (let ((if-form (getf check-form :if 'if-not-supplied))
        (on-fail (getf check-form :on-fail)))
    (when (eql if-form 'if-not-supplied)
      (error (format nil ":if not supplied in ':check ~a'!"
                     check-form)))
    `(unless ,if-form
       ,(if on-fail
            `(error ,on-fail)
            `(error (format nil "Check failed:~%~a" '(,@check-form)))))))

;;; TODO: handle functions by self
(defmacro defnode (name (&rest lambda-list)
                   &body args
                   &key (func (error "'func' must be provided!"))
                        ((:documentation doc) "")
                        (check nil check-supplied-p))
  `(defun ,name ,lambda-list
     ,doc
     ,@(append
         (when check-supplied-p
           (map 'list #'expand-check-form
                (collect-keyword-values :check args)))
         (list
           `(intern-function-node
              (make-instance 'function-node
                             :func ,func
                             :args ,(expand-lambda-list
                                      (parse-lambda-list lambda-list))))))))
