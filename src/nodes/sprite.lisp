(in-package :cc.aquarne.sonolisp/nodes)

(defnode sprite-p (id)
  :func "HasSkinSprite"
  :documentation "Checks if a skin sprite is available.")

(defnode draw (id x1 y1
                  x2 y2
                  x3 y3
                  x4 y4
                  z
                  alpha)
  :func "Draw"
  :documentation "Draws a skin sprite. Points are in the order of bottom-left, top-left, top-right, bottom-right.")

(defnode draw-curved-b (id x1 y1
                           x2 y2
                           x3 y3
                           x4 y4
                           z
                           alpha
                           segment-count
                           cxB cyB)
  :func "DrawCurvedB"
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
  :func "DrawCurvedBT"
  :documentation "Draw a skin sprite curved edges. Points are in the order of bottom-left, top-left, top-right, bottom-right.")

(defnode draw-curved-l (id x1 y1
                           x2 y2
                           x3 y3
                           x4 y4
                           z
                           alpha
                           segment-count
                           cxL cyL)
  :func "DrawCurvedL"
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
  :func "DrawCurvedLR"
  :documentation "Draw a skin sprite curved edges. Points are in the order of bottom-left, top-left, top-right, bottom-right.")

(defnode draw-curved-r (id x1 y1
                           x2 y2
                           x3 y3
                           x4 y4
                           z
                           alpha
                           segment-count
                           cxR cyR)
  :func "DrawCurvedR"
  :documentation "Draw a skin sprite curved edge. Points are in the order of bottom-left, top-left, top-right, bottom-right.")

(defnode draw-curved-t (id x1 y1
                           x2 y2
                           x3 y3
                           x4 y4
                           z
                           alpha
                           segment-count
                           cxT cyT)
  :func "DrawCurvedT"
  :documentation "Draw a skin sprite curved edge. Points are in the order of bottom-left, top-left, top-right, bottom-right.")
