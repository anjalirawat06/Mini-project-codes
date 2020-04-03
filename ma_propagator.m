function [v_vnew, v_rnew] = ma_propagator(v_vel, v_pos, h_RK4)
        v_a = pr_f(v_pos);  %integrating using RK4
        v_b = pr_f(v_pos + (h_RK4/2) * v_a);  
        v_c = pr_f(v_pos + (h_RK4/2) * v_b);
        v_d = pr_f(v_pos + h_RK4 * v_c);
        v_vnew = v_vel + (h_RK4/6) * (v_a + 2*v_b + 2*v_c + v_d); %calculating velocity after small time h_RK4
        v_rnew = v_pos + v_vel*h_RK4;  %calculating position after small time h_RK4
end
