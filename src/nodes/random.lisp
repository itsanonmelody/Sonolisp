(in-package :cc.aquarne.sonolisp/nodes)

(defnode random (min max)
  :func "Random"
  :documentation "Generates a random number inclusively between a min and max value.")

(defnode random* (min max)
  :func "RandomInteger"
  :documentation "Generates a random integer inclusively between a min and max value.")
