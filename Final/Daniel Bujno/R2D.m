% 2 Dimensional Rotation Matrix.
function mat = R2D(theta)
c = cos(theta);
s = sin(theta);
mat = [c,s;
      -s,c];

end