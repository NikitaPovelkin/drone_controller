;; Auto-generated. Do not edit!


(when (boundp 'drone_input_msgs::DroneControlInput)
  (if (not (find-package "DRONE_INPUT_MSGS"))
    (make-package "DRONE_INPUT_MSGS"))
  (shadow 'DroneControlInput (find-package "DRONE_INPUT_MSGS")))
(unless (find-package "DRONE_INPUT_MSGS::DRONECONTROLINPUT")
  (make-package "DRONE_INPUT_MSGS::DRONECONTROLINPUT"))

(in-package "ROS")
;;//! \htmlinclude DroneControlInput.msg.html


(defclass drone_input_msgs::DroneControlInput
  :super ros::object
  :slots (_w _a _s _d _i _j _k _l ))

(defmethod drone_input_msgs::DroneControlInput
  (:init
   (&key
    ((:w __w) 0)
    ((:a __a) 0)
    ((:s __s) 0)
    ((:d __d) 0)
    ((:i __i) 0)
    ((:j __j) 0)
    ((:k __k) 0)
    ((:l __l) 0)
    )
   (send-super :init)
   (setq _w (round __w))
   (setq _a (round __a))
   (setq _s (round __s))
   (setq _d (round __d))
   (setq _i (round __i))
   (setq _j (round __j))
   (setq _k (round __k))
   (setq _l (round __l))
   self)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:s
   (&optional __s)
   (if __s (setq _s __s)) _s)
  (:d
   (&optional __d)
   (if __d (setq _d __d)) _d)
  (:i
   (&optional __i)
   (if __i (setq _i __i)) _i)
  (:j
   (&optional __j)
   (if __j (setq _j __j)) _j)
  (:k
   (&optional __k)
   (if __k (setq _k __k)) _k)
  (:l
   (&optional __l)
   (if __l (setq _l __l)) _l)
  (:serialization-length
   ()
   (+
    ;; int8 _w
    1
    ;; int8 _a
    1
    ;; int8 _s
    1
    ;; int8 _d
    1
    ;; int8 _i
    1
    ;; int8 _j
    1
    ;; int8 _k
    1
    ;; int8 _l
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _w
       (write-byte _w s)
     ;; int8 _a
       (write-byte _a s)
     ;; int8 _s
       (write-byte _s s)
     ;; int8 _d
       (write-byte _d s)
     ;; int8 _i
       (write-byte _i s)
     ;; int8 _j
       (write-byte _j s)
     ;; int8 _k
       (write-byte _k s)
     ;; int8 _l
       (write-byte _l s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _w
     (setq _w (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _w 127) (setq _w (- _w 256)))
   ;; int8 _a
     (setq _a (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _a 127) (setq _a (- _a 256)))
   ;; int8 _s
     (setq _s (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _s 127) (setq _s (- _s 256)))
   ;; int8 _d
     (setq _d (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _d 127) (setq _d (- _d 256)))
   ;; int8 _i
     (setq _i (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _i 127) (setq _i (- _i 256)))
   ;; int8 _j
     (setq _j (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _j 127) (setq _j (- _j 256)))
   ;; int8 _k
     (setq _k (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _k 127) (setq _k (- _k 256)))
   ;; int8 _l
     (setq _l (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _l 127) (setq _l (- _l 256)))
   ;;
   self)
  )

(setf (get drone_input_msgs::DroneControlInput :md5sum-) "a6513e4e1c03e5976bc99005c604e739")
(setf (get drone_input_msgs::DroneControlInput :datatype-) "drone_input_msgs/DroneControlInput")
(setf (get drone_input_msgs::DroneControlInput :definition-)
      "# Cyclic controls
int8 w
int8 a
int8 s
int8 d

# Pedals
int8 i
int8 j
int8 k
int8 l

")



(provide :drone_input_msgs/DroneControlInput "a6513e4e1c03e5976bc99005c604e739")


