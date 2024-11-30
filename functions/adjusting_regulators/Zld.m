function [Z] = Zld(deg_increase, w)
% Zld - (leading zero) returns a zero that, when multiplied by an open-loop
%    transfer function, increases:
%        - the phase by deg_increase degrees
%    at the given frequency w
    assert((deg_increase > 0) && (deg_increase < 90));
    assert(w > 0);
    
    tau = (1/w)*tand(deg_increase);
    s = tf('s');
    Z = 1 + tau*s;
end

