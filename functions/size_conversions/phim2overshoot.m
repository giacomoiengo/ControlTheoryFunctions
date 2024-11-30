function [overshoot] = phim2overshoot(phim)
% phim2overshoot - returns the overshoot percentage given the phase margin (rad)
    assert((phim >= 0) && (phim <= pi));
    
    zeta = phim2zeta(phim);
    overshoot = zeta2overshoot(zeta);
end
