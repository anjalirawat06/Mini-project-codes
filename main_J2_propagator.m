v_pos = [7000;0;0];                  %km
MU = 3.986004418*1.0e+05;            %km^3/s^-2
v_vel = [0;sqrt(MU/7000);0];         %km/s
     
time = (2*3.14*7000^1.5)/sqrt(MU);   %total time (s)
N = 1;                               % Number of orbits to be propagated for
t_f = time * N;                      % Total time of simulation
h_RK4 = 1;                           %step size (s) 

% Expected output
v_pos1 = [7000;0;0];
v_vel1 = [0;sqrt(MU/7000);0];

for loop_index = 0:h_RK4:t_f        % Run Integrator, step-size = h_RK4, final time = t_f
    [v_vnew,v_rnew] = ma_RK4(v_vel, v_pos, h_RK4); 
    v_vel = v_vnew;                  %updating (i - th) state with (i+1 - th) state
    v_pos = v_rnew; 
end

disp(v_pos);
disp(v_vel);
error_r = ma_error_calc(v_pos, v_pos1, true);
error_v = ma_error_calc(v_vel, v_vel1, true);
disp(error_r);
disp(error_v);