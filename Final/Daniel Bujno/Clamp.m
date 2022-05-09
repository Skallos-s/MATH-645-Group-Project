% Clamp wall (u-v) to vector w.
function vec = Clamp(u,v,w)

% Set up a system of equations to solve.
M = [v(2)-u(2), u(1)-v(1);
     w(2)     , w(1)];
b = [u(1)*v(2)-u(2)*v(1); 0];

vec = M\b;

end