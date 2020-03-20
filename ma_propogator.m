function [m_vnew, m_rnew]=ma_propogator(v, r, h)
        x = r(1);  %extracting x,y,z
        y = r(2);
        z = r(3);
        m_a = f(x, y, z);  %storing ax,ay,az in array a
        m_b = f(x+(h*m_a(1))/2, y+(h*m_a(2))/2, z+(h*m_a(3))/2);  %a(1) implies ax
        m_c = f(x+(h*m_b(1))/2, y+(h*m_b(2))/2, z+(h*m_b(3))/2);
        m_d = f(x+(h*m_c(1)), y+(h*m_c(2)), z+(h*m_c(3)));
        m_vnew = v+(h/6)*(m_a+2*m_b+2*m_c+m_d); %calculating velocity after small time h
        m_rnew=r+v*h;  %calculating position after small time h
end