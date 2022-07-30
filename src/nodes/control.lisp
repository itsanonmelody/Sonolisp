(in-package :cc.aquarne.sonolisp/nodes)

(defnode progn (&rest expr)
  :func "Execute"
  :documentation "Evaluates multiple expressions from first to last and returns the last evaluated expression.")

(defnode if (cond true-expr &optional (false-expr nil))
  :func "If"
  :documentation "Conditionally executes one of two expressions according to the value of cond.")

(defnode jloop (&rest branches)
  :func "JumpLoop"
  :documentation "Executes the zeroth branch, then executes the branch pointed by the result of the previous branch. Keeps repeating until the last branch is executed and returns its result.")

(defnode switch (cond &rest case-expr)
  :func "Switch"
  :documentation "Executes an expression whose case pair is equal to cond. Returns 0 if none matches."
  :check (:if (cl:plusp (cl:length case-expr))
          :on-fail "There must at least be one case!")
  :check (:if (cl:evenp (cl:length case-expr))
          :on-fail "There must be an even number of cases and expressions!"))

(defnode switch* (cond &rest case-expr-default)
  :func "SwitchWithDefault"
  :documentation "Executes an expression whose case pair is equal to cond. The last expression is considered the default expression and requires no case pairing."
  :check (:if (cl:plusp (cl:length case-expr-default))
          :on-fail "There must be at least be one case!")
  :check (:if (cl:oddp (cl:length case-expr-default))
          :on-fail "There must be an even number of cases and expressions, excluding the default!"))

(defnode switch-int (cond &rest expr)
  :func "SwitchInteger"
  :documentation "Executes a single expression from many depending on the value of cond. Returns 0 if none matches."
  :check (:if (cl:plusp (cl:length expr))
          :on-fail "There must be at least one expression!"))

(defnode switch-int* (cond &rest expr-default)
  :func "SwitchIntegerWithDefault"
  :documentation "Executes a single expression from many depending on the value of cond. The last expression is considered as the default."
  :check (:if (cl:plusp (cl:length expr-default))
          :on-fail "There must be at least one expression!"))

(defnode while (cond &rest expr)
  :func "While"
  :documentation "Executes multiple expressions in order for first to last while cond remains true.")
