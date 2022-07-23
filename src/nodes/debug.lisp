(in-package :cc.aquarne.sonolisp/nodes)

(defnode debug-p ()
  :name "IsDebug"
  :documentation "Check if the engine is in debug mode.")

(defnode debug-log (expr)
  :name "DebugLog"
  :documentation "Logs the value of an expression during debug mode to the bottom right of the screen.")

(defnode debug-pause ()
  :name "DebugPause"
  :documentation "Pauses the level during debug mode.")
