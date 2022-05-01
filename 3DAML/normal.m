function vec = normal(quad)

vec = cross(quad(:,1)-quad(:,2),quad(:,1)-quad(:,3));