function [sysTD] = tu(sysTC, T)
% tu - returns a discrete-time regulator, given a continuous-time regulator
%    and the sampling period.
%
%    The conversion is done using the Tustin's method
    assert(T > 0);
   
    sysTD = tb(sysTC, T, 0.5);
end