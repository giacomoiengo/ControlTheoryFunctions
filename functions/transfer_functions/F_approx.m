function [tfa] = F_approx(phim, time)
% F_approx - returns an approximate closed-loop transfer function which
%    has the specified phase margin (rad) and settiling time.
% 
%    The settling time is specified as time = [Ta epsilon], where:
%        - Ta is the actual time in seconds
%        - epsilon is the percentage which defines the error band
    assert((phim >= 0) && (phim <= pi));
    assert(length(time) == 2);
    assert(time(1) > 0);
    assert((time(2) > 0) && (time(2) <= 100));

    s = tf('s');
    phimDeg = rad2deg(phim);
    Ta = time(1);
    epsilon = time(2);
    coeff = -log(0.01*epsilon);
    

    if phimDeg <= 75
        zeta = phim2zeta(phim);
        wc = coeff/(zeta*Ta);
        tfa = 1/(1+ 2*zeta*s/wc + (s^2)/wc^2);
    else
        wc = coeff/Ta;
        tfa = 1/(1+s/wc);
    end

end

