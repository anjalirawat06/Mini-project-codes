function [v_vnew, v_rnew] = ma_RK4(v_vel, v_pos, h_RK4)
% Runge-Kutta Fourth Order Integrator
        v1 = v_vel;
        v_a = RK_orbit_dynamics(v_pos);
        
        v2 = v_vel + (h_RK4/2)*v_a;
        v_b = RK_orbit_dynamics(v_pos + (h_RK4/2)*v1); 
        
        v3 = v_vel + (h_RK4/2)*v_b;
        v_c = RK_orbit_dynamics(v_pos + (h_RK4/2)*v2); 
        
        v4 = v_vel + h_RK4*v_c;
        v_d = RK_orbit_dynamics(v_pos + h_RK4*v3); 
       
        v_vnew = v_vel + (h_RK4/6) * (v_a + 2*v_b + 2*v_c + v_d); %calculating velocity after small time h_RK4
        v_rnew = v_pos + (h_RK4/6) * (v1 + 2*v2 + 2*v3 + v4);  %calculating position after small time h_RK4
end