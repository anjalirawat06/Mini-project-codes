pos = input('enter initial position matrix [x,y,z]: ');
vel = input('enter initial velocity matrix [vx,vy,vz]: ');  %initial values
time = input('enter total time: ');   %total time
n = 1000000;
step_size = time/n;  %step size
for loop_index = 1:n   %going n times to reach final point
    [vnew, rnew] = ma_propagator(vel, pos, step_size); 
    vel = vnew;  %updating arguments of propagator
    pos = rnew;
end
disp(vel);  %final result
disp(pos);
