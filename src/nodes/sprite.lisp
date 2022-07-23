(in-package :cc.aquarne.sonolisp/nodes)

(defnode sprite-p (id)
  :name "HasSkinSprite"
  :documentation "Checks if a skin sprite is available.")

(defnode draw (id x1 y1
                  x2 y2
                  x3 y3
                  x4 y4
                  z
                  alpha)
  :name "Draw"
  :documentation "Draws a skin sprite. Points are in the order of bottom-left, top-left, top-right, bottom-right.")

(defnode draw-curved-b (id x1 y1
                           x2 y2
                           x3 y3
                           x4 y4
                           z
                           alpha
                           segment-count
                           cxB cyB)
  :name "DrawCurvedB"
  :documentation "Draw a skin sprite curved edge. Points are in the order of bottom-left, top-left, top-right, bottom-right.")

(defnode draw-curved-bt (id x1 y1
                           x2 y2
                           x3 y3
                           x4 y4
                           z
                           alpha
                           segment-count
                           cxB cyB
                           cxT cyT)
  :name "DrawCurvedBT"
  :documentation "Draw a skin sprite curved edges. Points are in the order of bottom-left, top-left, top-right, bottom-right.")

(defnode draw-curved-l (id x1 y1
                           x2 y2
                           x3 y3
                           x4 y4
                           z
                           alpha
                           segment-count
                           cxL cyL)
  :name "DrawCurvedL"
  :documentation "Draw a skin sprite curved edge. Points are in the order of bottom-left, top-left, top-right, bottom-right.")

(defnode draw-curved-lr (id x1 y1
                           x2 y2
                           x3 y3
                           x4 y4
                           z
                           alpha
                           segment-count
                           cxL cyL
                           cxR cyR)
  :name "DrawCurvedLR"
  :documentation "Draw a skin sprite curved edges. Points are in the order of bottom-left, top-left, top-right, bottom-right.")

(defnode draw-curved-r (id x1 y1
                           x2 y2
                           x3 y3
                           x4 y4
                           z
                           alpha
                           segment-count
                           cxR cyR)
  :name "DrawCurvedR"
  :documentation "Draw a skin sprite curved edge. Points are in the order of bottom-left, top-left, top-right, bottom-right.")

(defnode draw-curved-t (id x1 y1
                           x2 y2
                           x3 y3
                           x4 y4
                           z
                           alpha
                           segment-count
                           cxT cyT)
  :name "DrawCurvedT"
  :documentation "Draw a skin sprite curved edge. Points are in the order of bottom-left, top-left, top-right, bottom-right.")
