function [sysTD] = ei(sysTC, T)
% ei - returns a discrete-time regulator, given a continuous-time regulator
%    and the sampling period.
%
%    The conversion is done using the backward Euler method
    assert(T > 0);
    
    sysTD = tb(sysTC, T, 1);
end