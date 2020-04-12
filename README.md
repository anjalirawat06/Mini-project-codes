# Mini-project-codes

## Function_1 name: main_J2_propagator
-----

**Code Author:** Anjali Rawat

**Created on:** 20/03/2020

**Last modified:** 12/04/2020

**Reviwed by:** KT Prajwal Prathiksh

**Description:**
----
Contains intial values of position and velocity of a satellite and total time after which position and velocity of satellite needs to be calculated. It defines the step size used for the process(here taken as 1sec). It calls the propagator function to calculate the new postion and velocity of the satellite after t=step size.  
The initial values of position and velocity are now set to the returned value of the propagator (i.e the new pos and vel after time =step size) and this loop runs till total time with given step size . After the loop we have the final pos and vel after total time t which is printed. Errors in pos and vel are calculated which is also printed.

**Formulae used:** 
----

1. velocity in circular orbit = sqrt(mu/r)

2. time period of circular orbit = (2*3.14*7000^1.5)/sqrt(MU)


**Variable Description:**
----
v_pos:(float)- column vector storing current position xyz coordinates wrt inertial frame of earth (km)

v_pos1:(float)- excpected output position to calculate error in position later (km)

MU:(float)- GMe (gravitational constant*mass of the earth) (km^3/s^-2)

v_vel:(float)- column vector storing current velocity xyz coordinates wrt inertial frame of earth (km/s)

v_vel1:(float)- excpected output velocity to calculate error in velocity later (km/s)

time:(float)- time period of circular orbit (s)

N:(int) - number of orbits to propagate for

t_f:(float) - total time for propagator to operate on (s)

h_RK4:(float)- step size(h) (s)

v_vnew:(float)- column vector storing new vx,vy,vz velocity matrix attained (km/s)

v_rnew:(float)- column vector storing new x,y,z position martix attained (km)

error_r:(float) - error in position

error_v:(float) - error in velocity

**Output:**
----
Prints the final velocity and final position along with their respective errors.

----
## Function_2 name: ma_RK4
----
**Code Author:** Anjali Rawat

**Created on:** 20/03/2020

**Last modified:** 12/04/2020

**Reviwed by:** KT Prajwal Prathiksh

**Description:**
----
Takes in arguments as initial position column vector, initial velocity coulmn vector, step size. Applies RK4 method to numerically intigrate the velocity and the position.

**Formulae used:**
----
RK4 method for multi variable-

https://www.myphysicslab.com/explain/runge-kutta-en.html

|                          |                              |
|--------------------------|------------------------------|
|v1 = v_vel | v_a = f(v_pos)|
|v2 = v_vel + (h/2)*v_a | v_b = f(v_pos + (h/2)*v1)| 
|v3 = v_vel + (h/2)*v_b | v_c = f(v_pos + (h/2)*v2) |
|v4 = v_vel + h*v_c | v_d = f(v_pos + h*v3) |
       
v_vnew = v_vel + (h/6) * (v_a + 2*v_b + 2*v_c + v_d) 

v_rnew = v_pos + (h/6) * (v1 + 2*v2 + 2*v3 + v4)  


**Variable description:**
----
v_vel:(float)- initial velocity vector sent by main function (km/s)

v_pos:(float)- initial position vector sent by main function (km)

h_RK4:(float)- step size sent by main function (s)

v_vnew - new velocity vector (km/s)

v_rnew - new position vector (km)

v_a, v_b, v_c, v_d, v1, v2, v3, v4- terms used in RK4 method (km/s^2)

** Output:**
----
v_vnew- new velocity vector after small time h (km/s)

v_rnew- new position vector after small time h (km)


----
## Function 3 name: RK_orbit_dynamics
----

**Code Author:** Anjali Rawat

**Created on:** 20/03/2020

**Last modified:** 12/04/2020

**Reviwed by:** KT Prajwal Prathiksh

**Description:**
----
Takes in arguments as sent by propagator (v_r) (the arguments of RK4 method like x, x+(h/2)*v1, x+(h/2)v2,etc.). Calculates the terms used in RK4 method (a,b,c,d) i.e dv/dt 

**Formulae used:**
----
dvx/dt = (-MU/r^3 - ((3*J2*MU*R^2) / (2*r^5)) * (1 - (5*z^2)/r^2 )) * x
dvy/dt = (-MU/r^3 - ((3*J2*MU*R^2) / (2*r^5)) * (1 - (5*z^2)/r^2 )) * y
dvz/dt = (-MU/r^3 - ((3*J2*MU*R^2) / (2*r^5)) * (3 - (5*z^2)/r^2 )) * z

[Link]https://drive.google.com/drive/folders/1uoC_6IF1Obe04ucFTo9ULzMcTpB9GBss?usp=sharing

**Variable description:**
----
MU- GMe (gravitational constant*mass of the earth) (km^3/s^-2)

r- distance of satellite from centre of earth (km)

J2- J2 factor of earth(oblateness factor) 

R- radius of the earth (km)

v_a:(float)- containing (ax,ay,az) paramenters of the RK4 method (km/s^2)

**Output:**
----
v_a- parameter of RK4 method to be used in propagator function

----
## Function 4 name: ma_error_calc
----

**Code Author:** Anjali Rawat

**Created on:** 20/03/2020

**Last modified:** 12/04/2020

**Reviwed by:** KT Prajwal Prathiksh

**Description:**
----
Calculating the error in position and velocity.

**Formulae used:**
----
error = ( |v_actual - v_expected| / |v_expected| ) * 100

**Variable description:**
----
reslt:(float) - stores the resulting errror in percentage

v_act:(float) - measured position/velocity vector after running the code 

v_exp:(float) - position/velocity excpected after running code

in_Percentage:(boolean) - stores boolean value true

**Output:**
----
reslt - percentage error of position/velocity

#### Constants used are taken from:

[Link]https://www.eoas.ubc.ca/~mjelline/Planetary%20class/14gravity1_2.pdf
 
 
 ----
 # Test cases:
 ----
 initial pos- [7000,0,0] km
 
 initial vel- [0,7.5461,0] km/s
 
 time period- 5825.6 s
 
  |**Input**                    |**Output**       |
  |-----------------------------|-----------------|
  |no of times the time period  |final position   |
  |h_RK4                        |final velocity   |
  |                             |error in position|
  |                             |error in velocity|
  
 **Test case 1:**
 ----
  |**Input**     |**Output**                |
  |--------------|--------------------------|
  |1             |[7000.0, -19.0, 0]  |
  |1             |[0.0205, 7.5460, 0]  |
  |              |0.2713%                   |
  |              |0.2713%                   |
  
  
  **Test case 2:**
  ----
  |**Input**     |**Output**                |
  |--------------|--------------------------|
  |3             |[6999.7, -64.5, 0]  |
  |1             |[0.0696, 7.5457, 0]   |
  |              |0.9217%                  |
  |              |0.9217%                  |

**Test case 3:**
----
  |**Input**     |**Output**                |
  |--------------|--------------------------|
  |5             |[6999.1, -110.0, 0]  |
  |1             |[0.1186, 7.5451, 0]   |
  |              |1.5721%                 |
  |              |1.5721%                 |
  
  **Test case 4:**
----
  |**Input**     |**Output**                |
  |--------------|--------------------------|
  |10            |[6996.5, -220.1, 0]   |
  |1             |[0.2372, 7.5423, 0]  |
  |              |3.1440%                 |
  |              |3.1440%                  |
  
  **Test case 5:**
 ----
  |**Input**     |**Output**                 |
  |--------------|---------------------------|
  |1             |[7000.0, -22.0, 0]    |
  |0.1           |[0.0237, 7.5460, 0] |
  |              |0.3144%                    |
  |              |0.3144%                    |
  
  **Test case 6:**
 ----
  |**Input**     |**Output**                 |
  |--------------|---------------------------|
  |1             |[7000.0, -22.2, 0]    |
  |0.01          |[0.0240, 7.5460, 0] |
  |              |0.3176%                    |
  |              |0.3176%                    |
