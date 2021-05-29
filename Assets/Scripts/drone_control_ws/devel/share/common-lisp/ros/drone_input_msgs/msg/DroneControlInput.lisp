; Auto-generated. Do not edit!


(cl:in-package drone_input_msgs-msg)


;//! \htmlinclude DroneControlInput.msg.html

(cl:defclass <DroneControlInput> (roslisp-msg-protocol:ros-message)
  ((w
    :reader w
    :initarg :w
    :type cl:fixnum
    :initform 0)
   (a
    :reader a
    :initarg :a
    :type cl:fixnum
    :initform 0)
   (s
    :reader s
    :initarg :s
    :type cl:fixnum
    :initform 0)
   (d
    :reader d
    :initarg :d
    :type cl:fixnum
    :initform 0)
   (i
    :reader i
    :initarg :i
    :type cl:fixnum
    :initform 0)
   (j
    :reader j
    :initarg :j
    :type cl:fixnum
    :initform 0)
   (k
    :reader k
    :initarg :k
    :type cl:fixnum
    :initform 0)
   (l
    :reader l
    :initarg :l
    :type cl:fixnum
    :initform 0))
)

(cl:defclass DroneControlInput (<DroneControlInput>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DroneControlInput>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DroneControlInput)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name drone_input_msgs-msg:<DroneControlInput> is deprecated: use drone_input_msgs-msg:DroneControlInput instead.")))

(cl:ensure-generic-function 'w-val :lambda-list '(m))
(cl:defmethod w-val ((m <DroneControlInput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_input_msgs-msg:w-val is deprecated.  Use drone_input_msgs-msg:w instead.")
  (w m))

(cl:ensure-generic-function 'a-val :lambda-list '(m))
(cl:defmethod a-val ((m <DroneControlInput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_input_msgs-msg:a-val is deprecated.  Use drone_input_msgs-msg:a instead.")
  (a m))

(cl:ensure-generic-function 's-val :lambda-list '(m))
(cl:defmethod s-val ((m <DroneControlInput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_input_msgs-msg:s-val is deprecated.  Use drone_input_msgs-msg:s instead.")
  (s m))

(cl:ensure-generic-function 'd-val :lambda-list '(m))
(cl:defmethod d-val ((m <DroneControlInput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_input_msgs-msg:d-val is deprecated.  Use drone_input_msgs-msg:d instead.")
  (d m))

(cl:ensure-generic-function 'i-val :lambda-list '(m))
(cl:defmethod i-val ((m <DroneControlInput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_input_msgs-msg:i-val is deprecated.  Use drone_input_msgs-msg:i instead.")
  (i m))

(cl:ensure-generic-function 'j-val :lambda-list '(m))
(cl:defmethod j-val ((m <DroneControlInput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_input_msgs-msg:j-val is deprecated.  Use drone_input_msgs-msg:j instead.")
  (j m))

(cl:ensure-generic-function 'k-val :lambda-list '(m))
(cl:defmethod k-val ((m <DroneControlInput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_input_msgs-msg:k-val is deprecated.  Use drone_input_msgs-msg:k instead.")
  (k m))

(cl:ensure-generic-function 'l-val :lambda-list '(m))
(cl:defmethod l-val ((m <DroneControlInput>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_input_msgs-msg:l-val is deprecated.  Use drone_input_msgs-msg:l instead.")
  (l m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DroneControlInput>) ostream)
  "Serializes a message object of type '<DroneControlInput>"
  (cl:let* ((signed (cl:slot-value msg 'w)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'a)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 's)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'd)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'i)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'j)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'k)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'l)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DroneControlInput>) istream)
  "Deserializes a message object of type '<DroneControlInput>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'w) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'a) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 's) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'd) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'j) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'k) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'l) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DroneControlInput>)))
  "Returns string type for a message object of type '<DroneControlInput>"
  "drone_input_msgs/DroneControlInput")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DroneControlInput)))
  "Returns string type for a message object of type 'DroneControlInput"
  "drone_input_msgs/DroneControlInput")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DroneControlInput>)))
  "Returns md5sum for a message object of type '<DroneControlInput>"
  "a6513e4e1c03e5976bc99005c604e739")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DroneControlInput)))
  "Returns md5sum for a message object of type 'DroneControlInput"
  "a6513e4e1c03e5976bc99005c604e739")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DroneControlInput>)))
  "Returns full string definition for message of type '<DroneControlInput>"
  (cl:format cl:nil "# Cyclic controls~%int8 w~%int8 a~%int8 s~%int8 d~%~%# Pedals~%int8 i~%int8 j~%int8 k~%int8 l~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DroneControlInput)))
  "Returns full string definition for message of type 'DroneControlInput"
  (cl:format cl:nil "# Cyclic controls~%int8 w~%int8 a~%int8 s~%int8 d~%~%# Pedals~%int8 i~%int8 j~%int8 k~%int8 l~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DroneControlInput>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DroneControlInput>))
  "Converts a ROS message object to a list"
  (cl:list 'DroneControlInput
    (cl:cons ':w (w msg))
    (cl:cons ':a (a msg))
    (cl:cons ':s (s msg))
    (cl:cons ':d (d msg))
    (cl:cons ':i (i msg))
    (cl:cons ':j (j msg))
    (cl:cons ':k (k msg))
    (cl:cons ':l (l msg))
))
