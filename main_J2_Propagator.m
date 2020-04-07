clear all
clc

MU = 3.986004418*1.0e+05; %km^3/s^-2

% Initial Values - Circular Orbit
v_r = [7000;0;0]; %km
v_v = [0;sqrt(MU/7000);0];  %km/s
TP = (2*3.14*7000^1.5)/sqrt(MU);   % Orbital time-period
N = 5; % Number of orbits to be propagated for

t_f = TP * N; % Total time of simulation
h_RK4 = 1;  %step size (s)

% Expected output
v_r_exp = v_r; 
v_v_exp = v_v;  

v_X = [v_r; v_v]; % System vector
for loop_index = 0:h_RK4:t_f  % Run Integrator, step-size = h_RK4, final time = t_f
    
    v_X_new = RK4(@orbit_dynamics, v_X, h_RK4); % Calculate the states at (i+1 - th) instant
    v_X = v_X_new; % Update (i - th) state with (i+1 - th) state
end

v_r = v_X(1:3); v_v = v_X(4:6); % Unpack states

error_r = vect_error(v_r, v_r_exp, true);
error_v = vect_error(v_v, v_v_exp, true);
disp(error_r);
disp(error_v);