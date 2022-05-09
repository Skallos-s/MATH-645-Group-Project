% 3 Dimensional Rotation Matrix along x-axis.
function mat = Rx(theta)
mat = [1,0,0; 0,cos(theta),-sin(theta); 0,sin(theta),cos(theta)];

end