(in-package :cc.aquarne.sonolisp/nodes)

(defnode progn (&rest expr)
  :name "Execute"
  :documentation "Evaluates multiple expressions from first to last and returns the last evaluated expression.")

(defnode if (cond true-expr false-expr)
  :name "If"
  :documentation "Conditionally executes one of two expressions according to the value of cond.")

(defnode bloop (&rest branches)
  :name "JumpLoop"
  :documentation "Executes the zeroth branch, then executes the branch pointed by the result of the previous branch. Keeps repeating until the last branch is executed and returns its result.")

(defnode switch (cond &rest case-expr)
  :name "Switch"
  :documentation "Executes an expression whose case pair is equal to cond. Returns 0 if none matches.")

(defnode switch* (cond &rest case-expr-default)
  :name "SwitchWithDefault"
  :documentation "Executes an expression whose case pair is equal to cond. The last expression is considered the default expression and requires no case pairing.")

(defnode switch-int (cond &rest expr)
  :name "SwitchInteger"
  :documentation "Executes a single expression from many depending on the value of cond. Returns 0 if none matches.")

(defnode switch-int* (cond &rest expr-default)
  :name "SwitchIntegerWithDefault"
  :documentation "Executes a single expression from many depending on the value of cond. The last expression is considered as the default.")

(defnode while (cond &rest expr)
  :name "While"
  :documentation "Executes multiple expressions in order for first to last while cond remains true.")
