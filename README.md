# delta-robot-public
Repository with simulation models and trajectory data sets for the Delta robot RL5-1450-6kg

The simulation model is obtained via transforming the 3D CAD robot model into Simulink model by Simscape Multibody Link plugin within Inventor Autodesk. 
The model is a graphical representation of the individual 3D CAD robot components that are supplemented with appropriate physical parameters as volumes, masses and MoI. 
The model was rearranged and supplemented particularly for inputs: reference joint coordinates; outputs: simulated joint coordinates, torques and coordinates of TCP; and for transformation blocks such as gearboxes.

To start simulation, run the file RL5_6kg_Model_Run.m. Read the comments given in the scripts. 

Cite as: 
Alikoc, B., Sustr, V., Zitek, F., Rehorik, J., Burget, P. and Lomakin A. Motion Modelling and Simulation of a 5-Axis Industrial Delta Robot. 
