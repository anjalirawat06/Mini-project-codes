function v_XDot  = orbit_dynamics(v_X)

    v_r = v_X(1:3); % Unpack position and velocity components
    v_v = v_X(4:6);
    
    MU = 398600.4415; %km^3/s^-2
    J2 = 1.082635854e-3; 
    R_E = 6378.1363; %km
    r = norm(v_r); %km
    
    x = v_r(1); % Unpack scalar components of position
    y = v_r(2); 
    z = v_r(3);
    
    tmp1 = (1.5*J2*MU*R_E^2)/r^5;
    tmp2 = 5*(z/r)^2;    
    v_pertb = [x*(tmp2 - 1); y*(tmp2 - 1); z*(tmp2 - 3)] * tmp1; % Calculate J2 Correction
    
    v_vDot = -(MU*v_r)/r^3 + v_pertb; % Calulate v-dot value    
    v_rDot = v_v; % Calculate r-dor
    
    v_XDot = [v_rDot; v_vDot];
end
