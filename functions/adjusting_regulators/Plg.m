function [P] = Plg(deg_decrease, w)
% Plg - (lagging pole) returns a pole which, when multiplied by an open-loop
%    transfer function, decreases:
%        - the phase by deg_decrease degrees
%    at the given frequency w
    assert((deg_decrease > 0) && (deg_decrease < 90));
    assert(w > 0);
    
    tau = (1/w)*tand(deg_decrease);
    s = tf('s');
    P = 1/(1 + tau*s);
end

