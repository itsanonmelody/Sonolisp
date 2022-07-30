(in-package cc.aquarne.sonolisp/nodes)

(defnode + (&rest expr)
  :func "Add"
  :documentation "Adds multiple expressions from first to last.")

(defnode - (&rest expr)
  :func "Subtract"
  :documentation "Subtracts multiple expressions from first to last.")

(defnode * (&rest expr)
  :func "Multiply"
  :documentation "Multiplies multiple expressions from first to last.")

(defnode / (&rest expr)
  :func "Divide"
  :documentation "Divides multiple expressions from first to last."
  :check (:if (cl:notany #'cl:zerop expr)
          :on-fail "There must not be any division by zero!"))

(defnode mod (&rest expr)
  :func "Mod"
  :documentation "Evaluates the modulus of multiple expressions from first to last.")

(defnode pow (&rest expr)
  :func "Power"
  :documentation "Exponentiates multiple expressions from first to last.")

(defnode log (expr)
  :func "Log"
  :documentation "Calculates the natural logarithm of an expression.")

(defnode degree (expr)
  :func "Degree"
  :documentation "Converts an expression from radians to degrees.")

(defnode radian (expr)
  :func "Radian"
  :documentation "Converts an expression from degrees to radians.")

(defnode abs (expr)
  :func "Abs"
  :documentation "Gets the absolute value of an expression.")

(defnode max (a b)
  :func "Max"
  :documentation "Gets the greater value between two expressions.")

(defnode min (a b)
  :func "Min"
  :documentation "Gets the lesser value between two expressions.")

(defnode sign (expr)
  :func "Sign"
  :documentation "Gets the sign of an expression.")

(defnode frac (expr)
  :func "Frac"
  :documentation "Gets the fractional part of an expression.")

(defnode trunc (expr)
  :func "Trunc"
  :documentation "Gets the integer part of an expression.")

(defnode cos (expr)
  :func "Cos"
  :documentation "Calculates the cos of an expression.")

(defnode sin (expr)
  :func "Sin"
  :documentation "Calculates the sin of an expression.")

(defnode tan (expr)
  :func "Tan"
  :documentation "Calculates the tan of an expression.")

(defnode cosh (expr)
  :func "Cosh"
  :documentation "Calculates the hyperbolic cos of an expression.")

(defnode sinh (expr)
  :func "Sinh"
  :documentation "Calculates the hyperbolic sin of an expression.")

(defnode tanh (expr)
  :func "Tanh"
  :documentation "Calculates the hyperbolic tan of an expression.")

(defnode acos (expr)
  :func "Arccos"
  :documentation "Calculates the arccos of an expression.")

(defnode asin (expr)
  :func "Arcsin"
  :documentation "Calculates the arcsin of an expression.")

(defnode atan (expr)
  :func "Arctan"
  :documentation "Calculates the arctan of an expression.")

(defnode atan2 (expr)
  :func "Arctan2"
  :documentation "Calculates the y/x arctan of an expression.")

(defnode ceil (expr)
  :func "Ceil"
  :documentation "Rounds an expression to the nearest greater integer.")

(defnode floor (expr)
  :func "Floor"
  :documentation "Rounds an expression to the nearest smaller integer.")

(defnode round (expr)
  :func "Round"
  :documentation "Rounds an expression to the nearest integer.")

(defnode clamp (expr min max)
  :func "Clamp"
  :documentation "Clamps an expression between a min and max value.")

(defnode remap (from-mix from-max to-min to-max expr)
  :func "Remap"
  :documentation "Remaps an expression from one range to another.")

(defnode lerp (min max expr)
  :func "Lerp"
  :documentation "Linearly interpolates an expression between a min and max value.")

(defnode lerp* (min max expr)
  :func "LerpClamped"
  :documentation "Linearly interpolates and clamps an expression between a min and max value.")

(defnode unlerp (min max expr)
  :func "Unlerp"
  :documentation "Linearly interpolates an expression inversely between a min and max value.")

(defnode unlerp* (min max expr)
  :func "UnlerpClamped"
  :documentation "Linearly interpolates and clamps an expression inversely between a min and max value.")

(defnode smooth (min max expr)
  :func "Smoothstep"
  :documentation "Smoothly interpolates an expression between a min and max value.")
