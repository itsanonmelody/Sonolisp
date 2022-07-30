(in-package :cc.aquarne.sonolisp/nodes)

(defmacro get (&rest parameters)
  (if (and (listp parameters)
           (not (null parameters)))
      `(get-impl ,@(first parameters) ,@(rest parameters))
      `(get-impl ,@(parameters))))

(defmacro get* (&rest parameters)
  (if (and (listp parameters)
           (not (null parameters)))
      `(get*-impl ,@(first parameters) ,@(rest parameters))
      `(get*-impl ,@(parameters))))

(defmacro set (&rest parameters)
  (if (and (listp parameters)
           (not (null parameters)))
      `(set-impl ,@(first parameters) ,@(rest parameters))
      `(set-impl ,@(parameters))))

(defmacro set* (&rest parameters)
  (if (and (listp parameters)
           (not (null parameters)))
      `(set*-impl ,@(first parameters) ,@(rest parameters))
      `(set*-impl ,@(parameters))))

(defnode get-impl (id index)
  :func "Get"
  :documentation "Gets the value at index from the block pointed by id.")

(defnode get*-impl (id index offset)
  :func "GetShifted"
  :documentation "Gets the value at (+ index offset) from the block pointed by id. Returns 0 if index is out of range. It is the same as (get id (+ index offset)).")

(defnode set-impl (id index value)
  :func "Set"
  :documentation "Sets a value at index from the block pointed by id.")

(defnode set*-impl (id index offset value)
  :func "SetShifted"
  :documentation "Sets a value at (+ index offset) from the block pointed by id. Returns 0 if index is out of range. It is the same as (set id (+ index offset) value).")
