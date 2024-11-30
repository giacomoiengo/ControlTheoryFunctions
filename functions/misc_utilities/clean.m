function [tf] = clean(dirty_tf)
% clean - returns the given trasfer function, in which cancellations 
%    have occurred between the numerator and the denominator.
    tf = zpk(minreal(dirty_tf, 1e-3));
end

