# Introduction 
The main goal of the project was to create the control system for stabilizing the position and rotation of the underactuated autonomous airship. The algorithm is based on the averaging and backstepping approach. 

# Getting Started
To find more information about averaging and backstepping method, read the article named as "temat8.pdf" (it is located in the main folder). The following algorithm is based on the methods presented in this article, but also introduce specified values of all the parameters used in control design. 

# Build and Test
To see the simulation results, run the <b>'Stabilization.m'</b> script. After that, 5 diagrams should appear on the screen - these diagrams describes the following dependencies: 
* spacecraft's position in time
* linear velocity of the spacecraft in time
* angular velocity of the spacecraft in time
* tau parameters in time
* tau ingredients (used for debugging and testing)

## DYNAMIC MODEL OF THE AIRSHIP

Airships are member of the family of under-actuated systems because they have fewer inputs than degrees of freedom. In this case, the dynamic modelling involves 6 equations with only 3 inputs. Because the airship can't be stabilized to a point using continous pure-state feedback law, the stabilization problem has been solved with an explicit homogeneous time-varying control law, based on an avaranging and backstepping approach.

The dynamic model has the particularity that the origin of the body fixed frame is the center of gravity, while in the cited works, it is located in the center of volume. An airship is propelled by thrust, and inputs are the main and tail thrusters and the tilt angle of the propellers.


