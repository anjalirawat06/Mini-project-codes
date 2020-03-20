pos = [1600, 5310, 3800];
vel = [-7.350, 0.4600, 2.470];  %initial values
time = 3200;   %total time
n = 100000;
step_size = time/n;  %step size
for loop_index = 1:n   %going n times to reach final point
    [vnew, rnew] = propogator(vel, pos, step_size); 
    vel = vnew;  %updating arguments of propagator
    pos = rnew;
end
disp(vel);  %final result
disp(pos);