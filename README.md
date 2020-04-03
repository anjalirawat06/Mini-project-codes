# Mini-project-codes

## Function_1 name: main
-----

**Code Author:** Anjali Rawat

**Created on:** 20/03/2020

**Last modified:** 04/03/2020

**Reviwed by:** KT Prajwal Prathiksh

**Description:**
----
Contains intial values of position and velocity of a satellite and total time after which position and velocity of satellite needs to be calculated. It defines the step size used for the process(here taken as 1sec). Total time is divided into n parts(time/step size). It calls the propagator function to calculate the new postion and velocity of the satellite after t=step size.  
The initial values of position and velocity are now set to the returned value of the propagator (i.e the new pos and vel after time =step size) and this loop runs n times. After the loop we have the final pos and vel after total time t which is printed. Errors in pos and vel are calculated which is also printed.

**Formulae used:** 
----
1. To calculate the number of time loop needs to run (n):  n=total_time/step_size

2. velocity in circular orbit = sqrt(mu/r)

3. time period of circular orbit = (2*3.14*7000^1.5)/sqrt(MU)

4. Error in position = ( |r_actual - r_expected| / |r_expected| ) * 100

5. Error in velocity = ( |vel_actual - vel_expected| / |vel_expected| ) * 100


**Variable Description:**
----
v_pos:(float)- column vector storing current position xyz coordinates wrt inertial frame of earth (km)

v_pos1:(float)- extra variable storing same value as v_pos to calculate error in position later (km)

MU:(float)- GMe (gravitational constant*mass of the earth) (km^3/s^-2)

v_vel:(float)- column vector storing current velocity xyz coordinates wrt inertial frame of earth (km/s)

v_vel1:(float)- extra variable storing same value as v_vel to calculate error in velocity later (km/s)

time:(float)- total time (s)

h_RK4:(float)- step size(h) (s)

n:(int)- no. of parts or no. of time loop has to run

v_vnew:(float)- column vector storing new vx,vy,vz velocity matrix attained (km/s)

v_rnew:(float)- column vector storing new x,y,z position martix attained (km)

**Output:**
----
Prints the final velocity and final position along with their respective errors.

----
## Function_2 name: ma_propagator
----
**Code Author:** Anjali Rawat

**Created on:** 20/03/2020

**Last modified:** 04/03/2020

**Reviwed by:** KT Prajwal Prathiksh

**Description:**
----
Takes in arguments as initial position column vector, initial velocity coulmn vector, step size. Applies RK4 method to numerically intigrate the velocity. Calculates the new position directly from initial velocity received in the arguments.

**Formulae used:**
----
RK4 method for multi variable-

https://www.myphysicslab.com/explain/runge-kutta-en.html

[ax,ay,az] = f(x,y,z)

[bx,by,bz] = f(x + h⁄2 *ax, y + h⁄2 *ay, z + h⁄2 *az)

[cx,cy,cz] = f(x + h⁄2 * bx, y + h⁄2 * by, z + h⁄2 * bz)

[dx,dy,dz] = f(x + h * cx, y + h * cy, z + h * cz)

velocity_new = velocity_initial + h⁄6 ([ax,ay,az] + 2*[bx,by,bz] + 2*[cx,cy,cz] + [dx,dy,dz])

To calculate new position:

position_new = position_initial + velocity_initial * small_time(step_size)

For vectors formula can be compressed to:

v_a = f(v_pos)

v_b = f(v_pos + (h/2) * v_a)

v_c = f(v_pos + (h/2) * v_b)

v_d = f(v_pos + h * v_c)

v_vnew = v_vel + (h/6) * (v_a + 2*v_b + 2*v_c + v_d)

v_rnew = v_pos + v_vel*h

**Variable description:**
----
v_vel:(float)- initial velocity vector sent by main function (km/s)

v_pos:(float)- initial position vector sent by main function (km)

h_RK4:(float)- step size sent by main function (s)

v_vnew - new velocity vector (km/s)

v_rnew - new position vector (km)

v_a, v_b, v_c, v_d - terms used in RK4 method (km/s^2)

** Output:**
----
v_vnew- new velocity vector after small time h (km/s)

v_rnew- new position vector after small time h (km)


----
## Function 3 name: pr_f
----

**Code Author:** Anjali Rawat

**Created on:** 20/03/2020

**Last modified:** 04/03/2020

**Reviwed by:** KT Prajwal Prathiksh

**Description:**
----
Takes in arguments as sent by propagator (v_r) (the arguments of RK4 method like x, x+(h/2)*a,etc.). Calculates the terms used in RK4 method (a,b,c,d) i.e dv/dt 

**Formulae used:**
----
dv/dt = (-MU/r^3 + ((3*J2*MU*R^2) / (2*r^5)) * ((5*v_r(3)^2)/r^2 - 1)) * v_r

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
  |1             |[7086.124, -355.1986, 0]  |
  |1             |[0.3754604, 7.485407, 0]  |
  |              |5.2213%                   |
  |              |5.0401%                   |
  
  
  **Test case 2:**
  ----
  |**Input**     |**Output**                |
  |--------------|--------------------------|
  |3             |[6369.907, -3526.033, 0]  |
  |1             |[3.587075, 6.468140, 0]   |
  |              |51.1698%                  |
  |              |49.6356%                  |

**Test case 3:**
----
  |**Input**     |**Output**                |
  |--------------|--------------------------|
  |5             |[1316.628, -7335.192, 0]  |
  |1             |[7.199281, 1.272610, 0]   |
  |              |132.5617%                 |
  |              |126.5446%                 |
  
  **Test case 4:**
----
  |**Input**     |**Output**                |
  |--------------|--------------------------|
  |10            |[4066.271, 6694.649, 0]   |
  |1             |[-6.105306, 3.701228, 0]  |
  |              |104.4178%                 |
  |              |95.6140%                  |
  
  **Test case 5:**
 ----
  |**Input**     |**Output**                 |
  |--------------|---------------------------|
  |1             |[7009.367, 50.98313, 0]    |
  |0.1           |[-0.05483922, 7.540690, 0] |
  |              |0.7405%                    |
  |              |0.7302%                    |
  
  **Test case 6:**
 ----
  |**Input**     |**Output**                 |
  |--------------|---------------------------|
  |1             |[7000.353, 91.83027, 0]    |
  |0.01          |[-0.09902049, 7.544887, 0] |
  |              |1.3119%                    |
  |              |1.3123%                    |
