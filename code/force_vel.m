function F_VEL = force_vel(V_MAX, V, F_MAX,a , b, F_MAXECC)
    
    vSteps = length(V);
    F_VEL(vSteps) = zeros;
    for i = 1:vSteps
        if V(i) > 0 % eccentric
            F_VEL(i) = (F_MAXECC-F_MAX)/abs(V_MAX) * V(i) + F_MAX;
        else % isometric/concentric
            F_VEL(i) = a*(V_MAX-V(i))./(b+V(i));
        end
        % normalize the F-v relationship to maximum force
        F_VEL(i) = F_VEL(i)/F_MAX;
    end
    