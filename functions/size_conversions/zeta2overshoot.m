function [overshoot] = zeta2overshoot(zeta)
% zeta2overshoot - returns the overshoot percentage given the damping ratio
    assert((zeta >= 0) && (zeta <= 1));

    overshoot = 100*exp(-(zeta*pi)/(sqrt(1-zeta^2)));
end

