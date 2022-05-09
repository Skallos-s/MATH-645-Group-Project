% Overlay checkmark.
function Check()

% Aquire plot axes.
X = get(gca, 'XLim');
Y = get(gca, 'YLim');
hold on

% Create coordinates of checkmark.
ax1 = X(1) + (X(2)-X(1)) / 18 * [3,7,15,13,7,5,3];
ax2 = Y(1) + (Y(2)-Y(1)) / 18 * [7,3,13,15,7,9,7];

% Check if y-axis are flipped.
% Flip checkmark in this case.
if get(gca, 'YDir') == "reverse"
    ax2 = Y(2) - ax2;
end

%Plot and reset axes if changed.
fill(ax1, ax2, 'g')
axis([X,Y])
hold off

end