% Recursively generate hypercube vertex and edge data.
% Vertices are 3xk matrix.
% Edges are 4xk matrix.
% Edge structure is two 2xk matrices stacked.
% One column is one edge.
function [V, E] = HyperCube(n)

% Base case of a line.
if n==1
    V = [1, -1];
    E = [1;-1];
else
    % Recursive step to generate data.
    [Vn, En] = HyperCube(n-1);
    [~, Vx] = size(Vn);
    [~, Ex] = size(En);

    % Top and Bottom of hypercubes.
    top = En(1:1*(n-1),:);
    bot = En(n:2*(n-1),:);
    
    % Bed of ones.
    Vl = ones(1,Vx);
    El = ones(1,Ex);
    
    % New vertex data.
    % Two copies of n-1 Hypercube, but offset along nth dimension.
    V = [Vn, Vn; Vl, -Vl];
    
    % New edge data.
    % Edges for first hypercube copy.
    % Edges for second ypercube copy.
    % Edges connecting corresponding vertices of the two hypercubes.
    E = [top, top, Vn;
         El , -El, Vl;
         bot, bot, Vn;
         El , -El,-Vl];
end

end