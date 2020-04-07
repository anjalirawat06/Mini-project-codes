function v_X_new = RK4(funcIn, v_X, h_RK4)
% Runge-Kutta Fourth Order Integrator

        v_k1 = funcIn(v_X); 
        v_k2 = funcIn(v_X + h_RK4 * v_k1 * 0.5);  
        v_k3 = funcIn(v_X + h_RK4 * v_k2 * 0.5);
        v_k4 = funcIn(v_X + h_RK4 * v_k3);
        
        v_X_new = v_X + (h_RK4/6) * (v_k1 + 2*v_k2 + 2*v_k3 + v_k4); 
       
end
