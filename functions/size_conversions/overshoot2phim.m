function [phim] = overshoot2phim(overshoot)
% overshoot2phim - returns the phase margin (rad) given the overshoot percentage 
    assert((overshoot > 0) && (overshoot < 100));
    
    zeta = overshoot2zeta(overshoot);
    phim = zeta2phim(zeta);
end

