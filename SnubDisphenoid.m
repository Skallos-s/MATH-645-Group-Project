function [facedata,facesize] = SnubDisphenoid(R)

k = R / 2;
q = R * 0.169022229424176;
r = k * sqrt(q);
s = k * sqrt((1 - q) / q / 2);
t = k * sqrt((1 - q) * 2);

verts = [t,-t, 0, 0, k,-k,0, 0;
         r, r,-r,-r,-s,-s,s, s;
         0, 0, t,-t, 0, 0,k,-k];
faces = [2,6,3,...
         2,4,6,...
         2,8,4,...
         2,7,8,...
         2,3,7,...
         5,3,6,...
         4,5,6,...
         4,1,5,...
         1,3,5,...
         7,1,8,...
         7,3,1,...
         8,1,4]
facedata = solid(verts,faces);
facesize = 3 * ones(1,12);