%author
%reviewed
v_pos = [7000;0;0];     %km
v_pos1 = [7000;0;0];    %duplicate variable kept for calculating error
MU = 3.986004418*1.0e+05; %km^3/s^-2
v_vel = [0;sqrt(MU/7000);0];  %km/s
v_vel1 = [0;sqrt(MU/7000);0];     %duplicate variable kept for calculating error
time = (2*3.14*7000^1.5)/sqrt(MU);   %total time (s)
h_RK4 = 1;  %step size (s)
n = time/h_RK4;

for loop_index = 1:n   %going n times to reach final point
    [v_vnew,v_rnew] = ma_propagator(v_vel, v_pos, h_RK4); 
    v_vel = v_vnew;  %updating arguments of propagator
    v_pos = v_rnew; 
end

fprintf('final velocity : %d km/s.\n',v_vel);  %final result
fprintf('final position : %d km.\n',v_pos);
error_pos = (norm(v_pos1 - v_pos)/norm(v_pos1))*100; %caculating error
error_vel = (norm(v_vel1 - v_vel)/norm(v_vel1))*100;
fprintf('error in velocity : %d % \n',error_vel);
fprintf('error in position : %d % \n',error_pos);
