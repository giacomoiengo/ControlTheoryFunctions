function [C] = Cld(db_increase, deg_increase, w)
% Cld - (lead compensator) returns a transfer function which, when multiplied by an open-loop
%    transfer function, increases:
%        - the magnitude by db_increase dB
%        - the phase by deg_increase degrees
%    at the given frequency w
    assert(w > 0);
    % TODO assert on first 2 arguments based on nichols diagram
    
    m_increase = db2mag(db_increase);
    wtau = (m_increase - cosd(deg_increase))/sind(deg_increase);
    m = wtau * (sind(deg_increase)/(cosd(deg_increase)-(1/m_increase)));
    tau = wtau/w;
    s = tf('s');
    C = (1 + tau*s)/(1 + (tau/m)*s);
end