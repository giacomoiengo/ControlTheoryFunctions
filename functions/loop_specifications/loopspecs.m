function loopspecs(L, lf, hf, phim, time)
% loopspecs - Allows you to determine if the open-loop transfer function L
%    meets the given specifications.
%
%    The specifications are:
%        - lf   = [ed wd] 
%        - hf   = [en wn]  
%        - phim  
%        - time = [Ta epsilon] 
%
%    The lf and hf parameters specify the desired behavior of L at low and high frequencies, respectively.
%    The time parameter specifies the desired time settling for the closed-loop transfer function derived from L.
%    The phim parameter specifies the desired phase margin for L.
%
%    The parameters lf, hf, and time can be set to empty vectors [] if not needed.
    assert(length(lf) == 2 || length(lf) == 0);
    if length(lf) == 2
        assert(lf(1) > 0);
        assert(lf(2) > 0);
    end
    assert(length(hf) == 2 || length(hf) == 0);
    if length(hf) == 2
        assert(hf(1) > 0);
        assert(hf(2) > 0);
    end
    assert((phim >= 0) && (phim <= pi));
    assert(length(time) == 2 || length(time) == 0);
    if length(time) == 2
        assert(time(1) > 0);
        assert((time(2) > 0) && (time(2) <= 100));
    end
    
    
    % global variables
    w_min = 1e-3;
    w_max = 1e3;
    db_min = -150;
    db_max = 150;    
    

    % parameters handling
    if length(time) == 2
        Ta = time(1);
        epsilon = time(2);
        coeff = -log(0.01*epsilon);
        wcmin = coeff/phim2zeta(phim)/Ta;
    elseif length(time) == 0
        wcmin = w_min;
    end


    if length(lf) == 2
        ed = lf(1);
        wd = lf(2);
    elseif length(lf) == 0
        ed = 1;
        wd = w_min;
    end


    if length(hf) == 2
        en = hf(1);
        wn = hf(2);
    elseif length(hf) == 0
        en = 1;
        wn = w_max;
    end
    
    % calculate values
    wcmax = en*wn;
    
    
    w = logspace(log10(w_min), log10(w_max), 1000);
    [magL, ~, woutL] = bode(L, w);
    dBL = db(squeeze(magL));


    % plotting
    h = findobj('Tag', 'LoopSpecs');
    if isempty(h)
        h = figure('Tag', 'LoopSpecs');
    else
        figure(h);
    end

    
    set(h, 'NextPlot', 'replacechildren');
    set(h, 'Position', [0,200,1500,500]);
    
    subplot(1,2,1);

    semilogx(woutL, dBL, 'DisplayName', 'L(s)');
    hold on;
    rectplot(w_min, wd,    db(1/ed), db_min, '1/e_d',    'red');
    rectplot(wn,    w_max, db_max,   db(en), 'e_n',              'green');
    rectplot(w_min, wcmin, db(1),    db_min, '\omega_{c_{min}}', 'blue');
    rectplot(wcmax, w_max, db_max,   db(1),  '\omega_{c_{max}}', 'magenta');
     

    ylim([db_min db_max]);
    xlim([w_min w_max]);
    
    grid on;
    legend;
    xlabel('Frequency (rad/s)');
    ylabel('Magnitude (dB)');
    title({ 
            'Loop Specs',
            sprintf('requested Pm = %.2f deg', round(rad2deg(phim),2))
    });
    hold off;

    subplot(1,2,2);
    margin(L);
    hold off;
end

