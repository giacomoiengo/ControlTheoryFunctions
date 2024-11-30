function [C] = Clg(db_decrease, deg_decrease, w)
% Clg - (lag compensator) returns a transfer function which, when multiplied by an open-loop
%    transfer function, decreases:
%        - the magnitude by db_decrease dB
%        - the phase by deg_decrease degrees
%    at the given frequency w
    assert(w > 0);
    % TODO assert on first 2 arguments based on nichols diagram

    C = 1/Cld(db_decrease, deg_decrease, w);
end