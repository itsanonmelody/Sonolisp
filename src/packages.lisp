;;;; All package definitions go here.

(in-package :cl-user)

(defpackage :cc.aquarne.sonolisp
  (:nicknames :sonolisp :sl)
  (:documentation "Main Sonolisp package containing all the necessary definitions.")
  (:use :common-lisp)
  ;; common-lisp package
  (:import-from :common-lisp
                :nil
                :t
                :&rest
                :defmacro)
  (:export :nil
           :t
           :&rest
           :defmacro)
  ;; node.lisp
  (:export :defnode
           :clear-nodes))

(defpackage :cc.aquarne.sonolisp/nodes
  (:nicknames :sonolisp/nodes :sl/nodes)
  (:documentation "Sonolisp function nodes.")
  (:use :cc.aquarne.sonolisp)
  ;; block.lisp
  (:export :get
           :get*
           :set
           :set*)
  ;; clip.lisp
  (:export :clip-p
           :play
           :play*)
  ;; control.lisp
  (:export :progn
           :if
           :bloop
           :switch
           :switch*
           :switch-int
           :switch-int*
           :while)
  ;; debug.lisp
  (:export :debug-p
           :debug-log
           :debug-pause)
  ;; entity.lisp
  (:export :spawn-entity)
  ;; logic.lisp
  (:export :=
           :/=
           :>
           :>=
           :<
           :<=
           :and
           :or
           :not
           :judge
           :judge*)
  ;; math.lisp
  (:export :+
           :-
           :*
           :/
           :mod
           :pow
           :log
           :degree
           :radian
           :abs
           :max
           :min
           :sign
           :frac
           :trunc
           :cos
           :sin
           :tan
           :cosh
           :sinh
           :tanh
           :acos
           :asin
           :atan
           :atan2
           :ceil
           :floor
           :round
           :clamp
           :remap
           :lerp
           :lerp*
           :unlerp
           :unlerp*
           :smooth)
  ;; particle.lisp
  (:export :particle-p
           :spawn-particle
           :destroy-particle
           :move-particle)
  ;; random.lisp
  (:export :random
           :random*)
  ;; sprite.lisp
  (:export :sprite-p
           :draw
           :draw-curved-b
           :draw-curved-bt
           :draw-curved-l
           :draw-curved-lr
           :draw-curved-r
           :draw-curved-t))
