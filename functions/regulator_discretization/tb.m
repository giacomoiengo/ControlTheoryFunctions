function [sysTD] = tb(sysTC, T, alpha)
% tb - returns a discrete-time regulator, given a continuous-time
%    regulator, the sampling period and the alpha parameter.
%
%    The conversion is done using the bilinear transform
    assert(T > 0);
    assert((alpha >= 0) && (alpha <= 1));

    z = zpk('z', T);
    ss = (1/T) * ((z-1)/(alpha*z + 1 - alpha));
    
    sysTC = tf(sysTC);
    num = sysTC.Numerator{1};
    den = sysTC.Denominator{1};
    
    N = 0;
    for i = 1:length(num)
        N = N + num(i) * ss^(length(num)-i);
    end
    
    D = 0;
    for i = 1:length(den)
        D = D + den(i) * ss^(length(den)-i);
    end
    
    sysTD = minreal(N/D);
end

