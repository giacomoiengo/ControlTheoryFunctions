function [wn, ze, re, im] = spec2pole(overshoot, time)
% spec2pole - from the given specifications
%     - overshoot percentage
%     - time = [Ta epsilon]
%    spec2pole returns the information to locate the desired
%    complex pole, which (combined with its conjugate) defines
%    a transfer function whose step-response has the
%    given specifications
%
%    Output Arguments
%        wn - undamped natural frequency of the pole
%        ze - damping ratio of the pole
%        re - real part of the pole
%        im - imaginary part of the pole
    assert((overshoot > 0) && (overshoot < 100));
    assert(length(time) == 2);
    assert(time(1) > 0);
    assert((time(2) > 0) && (time(2) <= 100));
    
    Ta = time(1);
    epsilon = time(2);
    coeff = -log(0.01*epsilon);

    syms x
    eqn = 100*exp(-(x*pi)/(sqrt(1-x^2))) == overshoot;
    ze = vpasolve(eqn, x, [0, pi/2]);
    ze = round(double(ze), 5);
    wn = coeff/(ze*Ta);
    re = -ze * wn;
    im = wn * sqrt(1 - ze^2);
end

