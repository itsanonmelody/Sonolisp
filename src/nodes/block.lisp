(in-package :cc.aquarne.sonolisp/nodes)

(defnode get (id index)
  :name "Get"
  :documentation "Gets the value at index from the block pointed by id.")

(defnode get* (id index offset)
  :name "GetShifted"
  :documentation "Gets the value at (+ index offset) from the block pointed by id. Returns 0 if index is out of range. It is the same as (get id (+ index offset)).")

(defnode set (id index value)
  :name "Set"
  :documentation "Sets a value at index from the block pointed by id.")

(defnode set* (id index offset value)
  :name "SetShifted"
  :documentation "Sets a value at (+ index offset) from the block pointed by id. Returns 0 if index is out of range. It is the same as (set id (+ index offset) value).")
