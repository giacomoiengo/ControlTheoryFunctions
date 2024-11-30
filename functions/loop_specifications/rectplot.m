function rectplot(x1,x2,y1,y2, name, color)
    fill([x1 x2 x2 x1], [y1 y1 y2 y2], color, 'FaceAlpha', 0.2, 'EdgeColor', 'none', 'DisplayName', name);
end

