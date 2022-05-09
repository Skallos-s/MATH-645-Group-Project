% Determine if v is "above" u.
% Specific function for Drawmaze.
function bool = IsAbove(u, v)
bool = v(1)*u(2) <= u(1)*v(2);

end