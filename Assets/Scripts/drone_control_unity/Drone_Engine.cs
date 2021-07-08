using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Unity_disaster_sim {
    [RequireComponent(typeof(BoxCollider))]
    public class Drone_Engine : MonoBehaviour, IEngine
    {
        #region Variables
        [Header("Engine Properties")]
        [SerializeField] private float maxPower = 1f;

        [Header("Propeller Properties")]
        [SerializeField] private Transform propeller;
        //[SerializeField] private float maxPropellerRotationSpeed = 80f;
        [SerializeField] private float propellerRotationSpeed = 0f;

        #endregion

        #region Methods
        public void InitEngine()
        {
            throw new System.NotImplementedException();
        }

        public void UpdateEngine(Rigidbody rb, float input)
        {
            Vector3 upVec = transform.up;
            upVec.x = 0f;
            upVec.z = 0f;
            float diff = 1 - upVec.magnitude;
            float finalDiff = Physics.gravity.magnitude * diff;

            Vector3 engineForce = Vector3.zero;
            engineForce = transform.up * ((rb.mass * Physics.gravity.magnitude  + finalDiff) + (input * maxPower)) / 4f;

            rb.AddForce(engineForce, ForceMode.Force);

            HandlePropellers();
        }
        #endregion

        void HandlePropellers()
        {
            if (!propeller) {
                return;
            }
            propellerRotationSpeed = (propellerRotationSpeed < 50f) ? propellerRotationSpeed + 0.1f : 50f;
            propeller.Rotate(Vector3.up, propellerRotationSpeed);
        }
    }
}

