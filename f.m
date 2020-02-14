function [ax,ay,az]=f(x,y,z)
    mu=3;
    r=sqrt(x^2+y^2+z^2);
    J2=5;
    R=5090;
    ax=(-mu*x)/r^3+((3*J2*mu*R^2*x)/(2*r^5))*((5*z^2)/r^2-1);
    ay=(-mu*y)/r^3+((3*J2*mu*R^2*y)/(2*r^5))*((5*z^2)/r^2-1);
    az=(-mu*z)/r^3+((3*J2*mu*R^2*z)/(2*r^5))*((5*z^2)/r^2-1);
end