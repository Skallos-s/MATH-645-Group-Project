% Calculate normal vector of first 3 3x1 column vectors in poly.
function vec = Normal(poly)

% Three vectors form a plane. Calculate normal vector from the cross
% product of two differences of vertices.
vec = cross(poly(:,1)-poly(:,2),poly(:,1)-poly(:,3));

end