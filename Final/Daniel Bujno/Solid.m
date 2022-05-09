% Generate Face Data for Polyhedron
function mat = Solid(verts, faces)

% Initialize data.
mat = zeros(3, length(faces));

% Assign each column the indexed vertex.
for j=1:length(faces)
    mat(:,j) = verts(:,faces(j));
end

end