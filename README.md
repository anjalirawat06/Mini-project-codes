# Mini-project-codes

Function 1 name: main


Description:

Inputs intial values of position and velocity of a satellite. 
It defines the step size used for the process(here taken as 1,000,000 th part of the total time). 
Calls the propagator function to calculate the new postion and velocity of the satellite after t=step size.  
The initial values of pos and vel are now set to the returned value of the propagator i.e the new pos and vel after time =step size and this loop runs n times.
 After the loop we have the final pos and vel after total time t which is printed.

Formulae used: 

To calculate the step size the total time is divided into n parts.   
step_size=total_time/n


Variable Description:

pos-storing current position xyz coordinates wrt inertial frame of earth (km)

vel-storing current velocity xyz coordinates wrt inertial frame of earth (km/s)

t-total time (s)

n=no of parts

step_size= step size(h) (s)

vnew- new vx,vy,vz velocity matrix attained (km/s)

rnew- new x,y,z position martix attained (km)






Function 2 name: ma_propagator


Description:

Arguments = initial position matix,initial velocity matrix,step size

Applies RK4 method to numerically intigrate the velocity. 
Calculates the new position directly from initial velocity received in the arguments.


Formulae used:

RK4 method for multi variable-

https://www.myphysicslab.com/explain/runge-kutta-en.html

[ax,ay,az] = f(x,y,z)

[bx,by,bz] = f(x + h⁄2 *ax, y + h⁄2 *ay, z + h⁄2 *az)

[cx,cy,cz] = f(x + h⁄2 * bx, y + h⁄2 * by, z + h⁄2 * bz)

[dx,dy,dz] = f(x + h * cx, y + h * cy, z + h * cz)

velocity_new = velocity_initial + h⁄6 ([ax,ay,az] + 2*[bx,by,bz] + 2*[cx,cy,cz] + [dx,dy,dz])

To calculate new position:

position_new = position_initial + velocity_initial * small_time(step_size)


Variable description:

v-initial velocity (km/s)

r-initial position (km)

h-step size (s)

v_new - new velocity matrix (km/s)

r_new - new position matrix (km/s)

x- x coordinate of position (km)

y- y coordinate of position (km)

z- z coordinate of position (km)

m_a, m_b, m_c, m_d - terms used in RK4 method (km/s^2)


Return value:

v_new- new velocity matrix after small time h (km/s)

r_new- new position matrix after small time h (km)





Function 3 name: pr_f


Description:

Arguments- as sent by propagator (the arguments of RK4 method like x, x+(h/2)*a,etc.)

Calculates the terms used in RK4 method (a,b,c,d) i.e dv/dt 


Formulae used:

dv/dt = (-mu * x)/r^3 + ( ( 3 * J2 * mu * R^2 * x ) / ( 2 * r^5 ) ) * ( (5 * z^2)/r^2 - 1)


Variable description:

mu- GMe (gravitational constant*mass of the earth) (km^3/s^-2)

r- distance of satellite from centre of earth (km)

J2- J2 factor of earth(oblateness factor) 

R- radius of the earth (km)

ax,ay,az- paramenters of the RK4 method (km/s^2)


Return value:

ax,ay,az- parameters of RK4 method whixh create the whole matrix a to be used in propagator function


Constants used are taken from:

https://www.eoas.ubc.ca/~mjelline/Planetary%20class/14gravity1_2.pdf
 
