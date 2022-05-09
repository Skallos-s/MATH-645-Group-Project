% 3 Dimensional Rotation Matrix along z-axis.
function mat = Rz(theta)
mat = [cos(theta),-sin(theta),0; sin(theta),cos(theta),0; 0,0,1];

end