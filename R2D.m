function mat = R2D(theta)
c = cos(theta);
s = sin(theta);
mat = [c,s, 0,0;
      -s,c, 0,0;
       0,0, c,s;
       0,0,-s,c];