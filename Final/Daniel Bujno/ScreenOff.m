% Screen Turning Off Animation
function ScreenOff()

% Draw a quickly-vanishing white star on a black background.
for j=3:-0.3:0
    % Star data.
    Star = [-3*j,-j,0,j,3*j,j,0,-j; 0,j,3*j,j,0,-j,-3*j,-j];

    % Backdrop.
    fill([-3,3,3,-3],[-3,-3,3,3],'k')
    hold on

    % Draw star.
    fill(Star(1,:),Star(2,:),'w')

    % Reset axis point.
    axis([-3,3,-3,3])
    hold off
    pause(0.001)
end

end