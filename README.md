# delta-robot-public
Repository with simulation models and trajectory data sets for the 5-axis Delta robot RL5-1450-6kg by Autonox24.

The simulation model is obtained via transforming the 3D CAD robot model into Simulink model by Simscape Multibody Link plugin within Inventor Autodesk. 
The model is a graphical representation of the individual 3D CAD robot components that are supplemented with appropriate physical parameters as dimensions, masses and MoI. The model was rearranged and supplemented particularly for inputs: reference joint coordinates; outputs: simulated joint coordinates, torques and coordinates of TCP; and for transformation blocks such as gearboxes.
The detailed scheme of the protected model "RL5_1450_6kg_Delta_robot_mod" in the Simulink file "RL5_6kg_2021a_enc.slx" is given by the file "RL5_6kg_Simscape_Model.pdf".

In Simulink model, the proposed mathematical kinematic and dynamic model of the robot can be found with MATLAB Function blocks. 

To start simulation, run the file RL5_6kg_Model_Run.m. Read the comments provided in the scripts. 
Then, the trajectories Trj2_RL5_1450_6kg_Ts_1ms.mat and Trj3_RL5_1450_6kg_Ts_1ms.mat can also be employed just loading those files and running the Simulink model.

A Simulink model for basic 3-DoF Delta robot, created via excluding the serial wrist arms and the telescopic shaft bodies from RL5-1450-6kg, is provided too. 
To simulate this model, run the file Basic_3DoF_Delta_Model_Run.m. In this simulation, the proposed dynamic model is compared with the model proposed in
"Codourey, A., 1996, “Dynamic modelling and mass matrix evaluation of the DELTA parallel robot for axes decoupling control,” IEEE International Conference on Intelligent Robots and Systems, Vol. 3, pp. 1211–1218."

Cite as: 
Alikoc, B., Sustr, V., Zitek, F., Burget, P. and Lomakin A. Motion Modelling of a 5-Axis Delta Robot with Telescopic Shafts, 2023. 
