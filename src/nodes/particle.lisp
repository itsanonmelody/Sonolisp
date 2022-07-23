(in-package :cc.aquarne.sonolisp/nodes)

(defnode particle-p (id)
  :name "HasParticleEffect"
  :documentation "Checks if a particle effect is available.")

(defnode spawn-particle (id x1 y1
                            x2 y2
                            x3 y3
                            x4 y4
                            duration
                            loop-p)
  :name "SpawnParticleEffect"
  :documentation "Spawns a particle effect. Points are in the order of bottom-left, top-left, top-right, bottom-right. Returned identifier can be used to control the particle effect instance using move-particle and destroy-particle functions.")

(defnode destroy-particle (id)
  :name "DestroyParticleEffect"
  :documentation "Destroys a particle effect instance.")

(defnode move-particle (id x1 y1
                           x2 y2
                           x3 y3
                           x4 y4)
  :name "MoveParticleEffect"
  :documentation "Moves a particle effect instance. Points are in the order of bottom-left, top-left, top-right, bottom-right.")
