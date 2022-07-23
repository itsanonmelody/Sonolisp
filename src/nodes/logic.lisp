(in-package :cc.aquarne.sonolisp/nodes)

(defnode = (a b)
  :name "Equal"
  :documentation "Compares if two expressions are equal.")

(defnode /= (a b)
  :name "NotEqual"
  :documentation "Compares if two expressions are not equal.")

(defnode > (a b)
  :name "Greater"
  :documentation "Compares if first expression is greater than the other.")

(defnode >= (a b)
  :name "GreaterOr"
  :documentation "Compares if first expression is greater than or equal to the other.")

(defnode < (a b)
  :name "Less"
  :documentation "Compares if first expression is less than the other.")

(defnode <= (a b)
  :name "LessOr"
  :documentation "Compares if first expression is less than or equal to the other.")

(defnode and (&rest expr)
  :name "And"
  :documentation "Performs the logical and operation on multiple expressions.")

(defnode or (&rest expr)
  :name "Or"
  :documentation "Performs the logical or operation on multiple expressions.")

(defnode not (expr)
  :name "Not"
  :documentation "Performs the logical not operation on an expression.")

(defnode judge(target-time player-time min-perfect max-perfect
                                       min-great max-great
                                       min-good max-good)
  :name "Judge"
  :documentation "Judges player timing. Returns 1 if perfect, 2 if great, 3 if good, and otherwise 0.")

(defnode judge* (target-time player-time max-perfect
                                         max-great
                                         max-good)
  :name "JudgeSimple"
  :documentation "Judges player timing. Returns 1 if perfect, 2 if great, 3 if good, and otherwise 0. It is the same as (judge target-time player-time -max-perfect max-perfect -max-great max-great -max-good max-good).")
