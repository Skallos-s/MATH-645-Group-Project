% Generate wall coordinates and colors for left-bend wall animation.
function [Walls, Colors] = LeftBend(NoBack, s)

% Wall vertices.
Walls = [0,3,1,3;
         1,3,2,3;
         2,3,3,3;
         0,3,0,2;
         0,2,1,2;
         1,2,2,2;
         2,2,2,1;
         2,1,2,0;
         3,3,3,2;
         3,2,3,1;
         3,1,3,0;
         2,0,3,0;]';

% Wall colors.
Colors = [ 99/256, 99/256, 99/256;
          137/256,137/256,137/256;
          115/256,115/256,115/256;
          0,0,0;
           87/256, 87/256, 87/256;
          107/256,107/256,107/256;
          137/256,137/256,137/256;
           99/256, 99/256, 99/256;
          125/256,125/256,125/256;
          107/256,107/256,107/256;
           87/256, 87/256, 87/256;
          0,0,0;]';

% Rubik's Cube color string modifier.
if s=="RUBIK"
    Colors = [1, 1  , 1;
              1, 1  , 0;
              1, 0.5, 0;
              0, 0  , 0;
              0, 0  , 1;
              0, 1  , 0;
              1, 1  , 0;
              1, 1  , 1;
              1, 0  , 0;
              0, 1  , 0;
              0, 0  , 1;
              0, 0  , 0;]';
end

% Intro modifier removing back wall.
if NoBack
    Walls = [Walls(:,1:11),[0;0;2;0],[3;0;5;0]];
    Colors = [Colors(:,1:11),[99/256;99/256;99/256],[99/256;99/256;99/256]];
end

end