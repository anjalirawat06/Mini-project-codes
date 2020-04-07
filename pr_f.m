function v_a = pr_f(v_r)
    MU = 3.986004418*1.0e+05; %km^3/s^-2
    r = norm(v_r); %km
    J2 = 1.081874*1.0e-03; 
    R = 6378.137; %km
    v_a=(-MU/r^3 + ((3*J2*MU*R^2) / (2*r^5)) * ((5*v_r(3)^2)/r^2-1))* v_r
end
