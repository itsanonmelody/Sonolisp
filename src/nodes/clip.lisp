(in-package :cc.aquarne.sonolisp/nodes)

(defnode clip-p (id)
  :func "HasEffectClip"
  :documentation "Checks if an effect clip is available.")

(defnode play (id dist)
  :func "Play"
  :documentation "Plays an effect clip with low latency.")

(defnode play* (id time dist)
  :func "PlayScheduled"
  :documentation "Plays an effect clip precisely at a scheduled time in the future.")
