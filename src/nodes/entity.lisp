(in-package :cc.aquarne.sonolisp/nodes)

(defnode spawn-entity (id data)
  :name "Spawn"
  :documentation "Spawns an entity with attached script and data injected into Entity Memory. Entity is not spawned immediately, rather it is placed in the queue and spawned on next update cycle's spawning system.")
