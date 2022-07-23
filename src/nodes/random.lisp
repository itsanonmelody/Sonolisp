(in-package :cc.aquarne.sonolisp/nodes)

(defnode random (min max)
  :name "Random"
  :documentation "Generates a random number inclusively between a min and max value.")

(defnode random* (min max)
  :name "RandomInteger"
  :documentation "Generates a random integer inclusively between a min and max value.")
