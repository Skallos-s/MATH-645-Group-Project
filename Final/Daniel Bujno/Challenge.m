% Challenge Introduction Screen.
% Input Challenge number and two strings.
function Challenge(n, txt1, txt2)

% Title string of the form " CHALLENGE ## ", where ## is the integer n.
k = 14 - strlength(string(n));
txtc = replaceBetween(" CHALLENGE 00 ", k, 13, string(n));

% Lengths of input strings.
x = strlength(txt1);
y = strlength(txt2);

% First line.
for j=1:12
    % Initialize backdrop.
    fill ([-3,3,3,-3], [-3,-3,3,3], 'k')

    % Create new string to display.
    % Monospace font and padding is used to get easy centering.
    txt = eraseBetween(txtc,j+1,13) + join(repelem(" ", 13-j),'');

    % Insert cursor.
    if (rem(j,4) == 2) || (rem(j,4) == 3)
        txt = replaceBetween(txt, j+1, j+1, "|");
    end

    % Draw text and reset axis.
    text(0, 1, txt, 'FontName', 'Courier New', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'white')
    axis([-3,3,-3,3])
    pause(0.1)
end

% First Line Hiatus.
for j=11:16
    % Initialize backdrop.
    txt = txtc;
    fill ([-3,3,3,-3], [-3,-3,3,3], 'k')

    % Insert cursor.
    if (rem(j,4) == 2) || (rem(j,4) == 3)
        txt = replaceBetween(txtc, 14, 14, "|");
    end

    % Draw text and reset axis.
    text(0, 1, txt, 'FontName', 'Courier New', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'white')
    axis([-3,3,-3,3])
    pause(0.1)
end

% Second Line.
for j=0:x-1
    % Initialize backdrop.
    fill ([-3,3,3,-3], [-3,-3,3,3], 'k')

    % Create new string to display.
    % Monospace font and padding is used to get easy centering.
    txt = eraseBetween(txt1,j+1,x) + join(repelem(" ", x-j),'');

    % Insert cursor.
    if (rem(j,4) == 2) || (rem(j,4) == 3)
        txt = replaceBetween(txt, j+1, j+1, "|");
    end

    % Draw text and reset axis.
    text(0, 1, txtc, 'FontName', 'Courier New', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'white')
    text(0, 0, txt, 'FontName', 'Courier New', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'white')
    axis([-3,3,-3,3])
    pause(0.1)
end

for j=0:y-1
    % Initialize backdrop.
    fill ([-3,3,3,-3], [-3,-3,3,3], 'k')

    % Create new string to display.
    % Monospace font and padding is used to get easy centering.
    txt = eraseBetween(txt2,j+1,y) + join(repelem(" ", y-j),'');

    % Insert cursor.
    if (rem(j,4) == 2) || (rem(j,4) == 3)
        txt = replaceBetween(txt, j+1, j+1, "|");
    end

    % Draw text and reset axis.
    text(0, 1, txtc, 'FontName', 'Courier New', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'white')
    text(0, 0, txt1, 'FontName', 'Courier New', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'white')
    text(0,-1, txt, 'FontName', 'Courier New', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'white')
    axis([-3,3,-3,3])
    pause(0.1)
end

% Draw final screen again.
fill ([-3,3,3,-3], [-3,-3,3,3], 'k')
text(0, 1, txtc, 'FontName', 'Courier New', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'white')
text(0, 0, txt1, 'FontName', 'Courier New', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'white')
text(0,-1, txt2, 'FontName', 'Courier New', 'FontSize', 30, 'HorizontalAlignment', 'center', 'Color', 'white')
axis([-3,3,-3,3])
pause(1)

end