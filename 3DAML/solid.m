function mat = solid(verts, faces)
mat = verts(:,faces(1));
for i=2:length(faces)
    mat = [mat, verts(:,faces(i))];
end