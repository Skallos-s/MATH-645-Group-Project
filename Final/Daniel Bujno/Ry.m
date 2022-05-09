% 3 Dimensional Rotation Matrix along y-axis.
function mat = Ry(theta)
mat = [cos(theta),0,sin(theta); 0,1,0; -sin(theta),0,cos(theta)];

end