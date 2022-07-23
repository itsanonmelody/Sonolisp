(in-package cc.aquarne.sonolisp/nodes)

(defnode + (&rest expr)
  :name "Add"
  :documentation "Adds multiple expressions from first to last.")

(defnode - (&rest expr)
  :name "Subtract"
  :documentation "Subtracts multiple expressions from first to last.")

(defnode * (&rest expr)
  :name "Multiply"
  :documentation "Multiplies multiple expressions from first to last.")

(defnode / (&rest expr)
  :name "Divide"
  :documentation "Divides multiple expressions from first to last.")

(defnode mod (&rest expr)
  :name "Mod"
  :documentation "Evaluates the modulus of multiple expressions from first to last.")

(defnode pow (&rest expr)
  :name "Power"
  :documentation "Exponentiates multiple expressions from first to last.")

(defnode log (expr)
  :name "Log"
  :documentation "Calculates the natural logarithm of an expression.")

(defnode degree (expr)
  :name "Degree"
  :documentation "Converts an expression from radians to degrees.")

(defnode radian (expr)
  :name "Radian"
  :documentation "Converts an expression from degrees to radians.")

(defnode abs (expr)
  :name "Abs"
  :documentation "Gets the absolute value of an expression.")

(defnode max (a b)
  :name "Max"
  :documentation "Gets the greater value between two expressions.")

(defnode min (a b)
  :name "Min"
  :documentation "Gets the lesser value between two expressions.")

(defnode sign (expr)
  :name "Sign"
  :documentation "Gets the sign of an expression.")

(defnode frac (expr)
  :name "Frac"
  :documentation "Gets the fractional part of an expression.")

(defnode trunc (expr)
  :name "Trunc"
  :documentation "Gets the integer part of an expression.")

(defnode cos (expr)
  :name "Cos"
  :documentation "Calculates the cos of an expression.")

(defnode sin (expr)
  :name "Sin"
  :documentation "Calculates the sin of an expression.")

(defnode tan (expr)
  :name "Tan"
  :documentation "Calculates the tan of an expression.")

(defnode cosh (expr)
  :name "Cosh"
  :documentation "Calculates the hyperbolic cos of an expression.")

(defnode sinh (expr)
  :name "Sinh"
  :documentation "Calculates the hyperbolic sin of an expression.")

(defnode tanh (expr)
  :name "Tanh"
  :documentation "Calculates the hyperbolic tan of an expression.")

(defnode acos (expr)
  :name "Arccos"
  :documentation "Calculates the arccos of an expression.")

(defnode asin (expr)
  :name "Arcsin"
  :documentation "Calculates the arcsin of an expression.")

(defnode atan (expr)
  :name "Arctan"
  :documentation "Calculates the arctan of an expression.")

(defnode atan2 (expr)
  :name "Arctan2"
  :documentation "Calculates the y/x arctan of an expression.")

(defnode ceil (expr)
  :name "Ceil"
  :documentation "Rounds an expression to the nearest greater integer.")

(defnode floor (expr)
  :name "Floor"
  :documentation "Rounds an expression to the nearest smaller integer.")

(defnode round (expr)
  :name "Round"
  :documentation "Rounds an expression to the nearest integer.")

(defnode clamp (expr min max)
  :name "Clamp"
  :documentation "Clamps an expression between a min and max value.")

(defnode remap (from-mix from-max to-min to-max expr)
  :name "Remap"
  :documentation "Remaps an expression from one range to another.")

(defnode lerp (min max expr)
  :name "Lerp"
  :documentation "Linearly interpolates an expression between a min and max value.")

(defnode lerp* (min max expr)
  :name "LerpClamped"
  :documentation "Linearly interpolates and clamps an expression between a min and max value.")

(defnode unlerp (min max expr)
  :name "Unlerp"
  :documentation "Linearly interpolates an expression inversely between a min and max value.")

(defnode unlerp* (min max expr)
  :name "UnlerpClamped"
  :documentation "Linearly interpolates and clamps an expression inversely between a min and max value.")

(defnode smooth (min max expr)
  :name "Smoothstep"
  :documentation "Smoothly interpolates an expression between a min and max value.")
