% Base is defined by a constant formula based on the width of the textbox
function result = dialogBox(textstr, xpos, ypos, width, height, background_color, dege_color, text_size, text_color)
    result = makeRectangle(width, height);  % First make a rectangle

    % Shift the x & y components to be ccntered focused
    xcomp = (xpos - round(width/2));        % Center X position
    ycomp = (ypos - round(height/2));       % Center Y position
    
    % Apply a shift transformation
    result(1,:) = result(1,:) + xcomp;
    result(2,:) = result(2,:) + ycomp;

    % Visually plot the results of the text box
    fill(result(1,:), result(2,:), background_color, 'EdgeColor', edge_color, 'LineWidth', 2);
    text(((0.2 * text_size)) + xcomp, height - (1.2 * text_size) + ycomp, textstr, 'FontSize', text_size, 'Color', text_color);
end