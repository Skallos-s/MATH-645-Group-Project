% Rotating Orb Mini Animation.
function s = Orb()

% Generate Icosahedron data.
[data,leng] = Icosahedron(1);

% Generate 360 colors of different hue.
col = hsv(360);

for j=0:2:360
    % Plot backdrop.
    fill([-3,3,3,-3], [0,0, 3, 3], 'c')
    hold on
    fill([-3,3,3,-3], [0,0,-3,-3], 'g')

    % Calculate rotated data.
    ndata = Rx(pi*j/30/2) * Ry(pi*j/20/2) * data;
    
    % Generate new color matrix.
    icocol = [col(rem(j+180,360)+1,:);
              col(rem(j+120,360)+1,:);
              col(rem(j+120,360)+1,:);
              col(rem(j+180,360)+1,:);
              col(rem(j+240,360)+1,:);
              col(rem(j+180,360)+1,:);
              col(rem(j+060,360)+1,:);
              col(rem(j+060,360)+1,:);
              col(rem(j+180,360)+1,:);
              col(rem(j+300,360)+1,:);
              col(rem(j+120,360)+1,:);
              col(rem(j+180,360)+1,:);
              col(rem(j+180,360)+1,:);
              col(rem(j+120,360)+1,:);
              col(rem(j+060,360)+1,:);
              col(rem(j+120,360)+1,:);
              col(rem(j+240,360)+1,:);
              col(rem(j+240,360)+1,:);
              col(rem(j+120,360)+1,:);
              col(rem(j+000,360)+1,:);];

    % Plot shape.
    PlotShape(ndata,leng, [-3,3,-3,3], icocol)
    hold off
    pause(0.01)
end

s = "ORB";

end