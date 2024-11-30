function [Ta, s] = stepinfoshort(tf, epsilon)
% stepinfoshort - prints the settling time and overshoot 
%    percentage of the step-response for the given transfer funciton. 
%    Also the epsilon parameter defines the error band for the settling time
    assert((epsilon > 0) && (epsilon <= 100));

    info = stepinfo(tf, 'SettlingTimeThreshold', epsilon/100);
    Ta = info.SettlingTime;
    s  = info.Overshoot;
    fprintf('[stepinfoshort]\n\t Ta%2d -> %.3f\n\t s%%   -> %.3f\n', epsilon, Ta, s);
end

