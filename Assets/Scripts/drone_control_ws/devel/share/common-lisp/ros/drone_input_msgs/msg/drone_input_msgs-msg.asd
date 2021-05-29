
(cl:in-package :asdf)

(defsystem "drone_input_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "DroneControlInput" :depends-on ("_package_DroneControlInput"))
    (:file "_package_DroneControlInput" :depends-on ("_package"))
  ))