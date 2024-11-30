function [sysTD] = ea(sysTC, T)
% ea - returns a discrete-time regulator, given a continuous-time regulator
%    and the sampling period.
%
%    The conversion is done using the forward Euler method
    assert(T > 0);

    sysTD = tb(sysTC, T, 0);
end