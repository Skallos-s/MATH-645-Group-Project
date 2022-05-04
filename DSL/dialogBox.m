% Dialog box is in the same style as the Dating Sim Dialog Boxes
function result = dialogBox(textstr, xpos, ypos, width, height, background_color, text_size, text_color)
    %
    result = makeRectangle(width, height);
    xcomp = (xpos - round(width/2));
    ycomp = (ypos - round(height/2));
    result(1,:) = result(1,:) + xcomp;
    result(2,:) = result(2,:) + ycomp;
    fill(result(1,:), result(2,:), background_color, 'EdgeColor', 'c', 'LineWidth', 2);
    text(((0.2 * text_size)) + xcomp, height - (1.2 * text_size) + ycomp, textstr, 'FontSize', text_size, 'Color', text_color);
    axis([-200 200 -100 200])
end