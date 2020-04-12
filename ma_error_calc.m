function reslt = ma_error_calc(v_act, v_exp, in_Percentage)
% Quantifies the L2 error between two vetors - v_actual & v_expected    

reslt = norm(v_act - v_exp) / norm(v_exp);
if in_Percentage == true
    reslt = reslt * 100;
elseif in_Percentage == false
    reslt = reslt;
end