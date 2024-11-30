function [dphim] = compensphim(wc, T)
% compensphim - returns the phase margin (rad) delta to add in order to
%    compensate the time delay introduced by the ZOH filter, given the
%    crossover frequency and the sampling period
    assert(wc > 0);
    assert(T > 0);
    
    ws = double(2*pi/T);
    dphim = deg2rad((wc/ws)*180);
end

