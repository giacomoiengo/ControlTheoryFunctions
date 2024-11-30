function [R_star] = ragazzini(F_star, G_star)
% ragazzini - returns the regulator, given the desired closed-loop 
%    transfer function and the process transfer function
    R_star = (1/G_star) * (F_star/(1-F_star));
end

