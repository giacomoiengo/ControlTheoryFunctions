function [zeta] = overshoot2zeta(overshoot)
% overshoot2zeta - returns the damping ratio given the overshoot percentage
    assert((overshoot > 0) && (overshoot < 100));
    
    syms x
    eqn = 100*exp(-(x*pi)/(sqrt(1-x^2))) == overshoot;
    zeta = round(double(vpasolve(eqn, x, [0, pi/2])), 5);
end

