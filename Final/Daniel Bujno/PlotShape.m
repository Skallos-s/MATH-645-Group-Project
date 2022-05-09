% Draw 3d shape projected on x-y plane.
% Input solid vertices, size of faces, plot axis, and face colors.
function PlotShape(facedata, facelength, axes, color)

r = 1; % Face indexing variable.
[x,~] = size(color); % Number of colors.

% Iterate through every face.
for j=1:length(facelength)
    poly = facedata(:, r : r+facelength(j)-1); % Calculate face.
    r = r + facelength(j); % Iterate face indexing variable.
    if [0,0,1]*Normal(poly) > 0 % Check if face is visible and plot if so.
        fill(poly(1,:),poly(2,:),color(rem(j-1,x)+1,:))
        axis(axes)
        hold on
    end
end

end