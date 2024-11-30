function [phim] = zeta2phim(zeta)
% zeta2phim - returns the phase margin (rad) given the damping ratio
    assert((zeta >= 0) && (zeta <= 1));
    
    phim = 2*asin(zeta);
end

