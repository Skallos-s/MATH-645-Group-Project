% Reflect direction vector d along normal vector n.
function r = Reflect(d, n)

r = d - 2*(d'*n)/(n'*n)*n;

end