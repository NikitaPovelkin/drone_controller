using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Unity_disaster_sim
{
    public interface IEngine
    {
        void InitEngine();
        void UpdateEngine(Rigidbody rb, float input);
    }
}
