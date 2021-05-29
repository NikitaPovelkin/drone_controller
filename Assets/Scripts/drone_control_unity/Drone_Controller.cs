using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using RosSharp.RosBridgeClient;

namespace Unity_disaster_sim {
    [RequireComponent(typeof(Rigidbody))]
    public class Drone_Controller : MonoBehaviour
    {
        [Header("Rigidbody Properties")]
        [SerializeField] private float weight = 0.5f;
        protected float startDrag;
        protected float startAngularDrag;

        private Rigidbody rigid_body;
        private Quaternion rotation_quat;
        private float throttle;
        private List<IEngine> engines = new List<IEngine>();

        void Awake() 
        {
            rigid_body = GetComponent<Rigidbody>();
            if (rigid_body) 
            {
                rigid_body.mass = weight;
                startDrag = rigid_body.drag;
                startAngularDrag = rigid_body.angularDrag;
            }
        }

        // Start is called before the first frame update
        protected void Start()
        {
            engines = GetComponentsInChildren<IEngine>().ToList<IEngine>();
            throttle = 0;
            rotation_quat = new Quaternion();
        }

        void FixedUpdate()
        {
            if (!rigid_body)
            {
                return;
            }

            throttle = Drone_Base_Rigidbody.throttle;
            rotation_quat = Drone_Base_Rigidbody.rotation;
            HandlePhysics();
        }

        protected void HandlePhysics()
        {
            HandleEngines(throttle);
            HandleControls(rotation_quat);
        }

        protected virtual void HandleEngines(float throttle)
        {
            foreach(IEngine engine in engines) {
                engine.UpdateEngine(rigid_body, throttle);
            }
        }

        protected virtual void HandleControls(Quaternion rotation_quat)
        {
            rigid_body.MoveRotation(rotation_quat);
        }
    }
}

