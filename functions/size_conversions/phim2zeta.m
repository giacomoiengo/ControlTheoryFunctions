function [zeta] = phim2zeta(phim)
% phim2zeta - returns the damping ratio given the phase margin (rad)
    assert((phim >= 0) && (phim <= pi));
    
    zeta = sin(phim/2);
end

