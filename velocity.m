function [vnew]=velocity(v,r,t)
        x=r(1);
        y=r(2);
        z=r(3);
        [ax,ay,az]=f(x,y,z);
        [bx,by,bz]=f(x+(t*ax)/2,y+(t*ay)/2,z+(t*az)/2);
        [cx,cy,cz]=f(x+(t*bx)/2,y+(t*by)/2,z+(t*bz)/2);
        [dx,dy,dz]=f(x+(t*cx),y+(t*cy),z+(t*cz));
        a=[ax,ay,az];
        b=[bz,by,bz];
        c=[cx,cy,cz];
        d=[dx,dy,dz];
        vnew=v+(t/6)*(a+2*b+2*c+d);
end