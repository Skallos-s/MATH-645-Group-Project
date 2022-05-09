% Generate data for Rubik's Cube of radius R and sticker clearance from
% edge delta.
function [facedata,facesize,colors] = Rubik(R, delta)

d = R/3-delta; % Temporary shortening.

% 9 stickers on one side.
% Iterate twice along rows and columns.
side = zeros(3,36);
for j=-1:1
    Kj = 2*R/3*j; % Shortener.
    for k=-1:1
        Kk = 2*R/3*k; % Shortener.
        I = (k+1)+3*(j+1); % Index
        % Particular sticker.
        side(:,1+4*I:1+4*I+3) = [Kj+d, Kj+d, Kj-d, Kj-d;
                                 Kk+d, Kk-d, Kk-d, Kk+d;
                                 R   , R   , R   , R];
    end
end

% Complete sticker data for all 54 stickers.
facedata = [side, Rx(pi)*side, Rx(pi/2)*side, Rx(3*pi/2)*side, Ry(pi/2)*side, Ry(3*pi/2)*side];
facesize = 4 * ones(1,54);

% Colormap.
c = [1, 0  , 0; % red
     1, 0.5, 0; % orange
     0, 1  , 0; % green
     0, 0  , 1; % blue
     1, 1  , 0; % yellow
     1, 1  , 1];% white
% For a solved cube.
% colors = repelem(c, 9, 1)

% Particular scramble.
colors = [c(3,:); c(3,:); c(6,:);
          c(1,:); c(4,:); c(5,:);
          c(4,:); c(2,:); c(4,:);

          c(2,:); c(6,:); c(5,:);
          c(1,:); c(3,:); c(6,:);
          c(6,:); c(5,:); c(3,:);
          
          c(3,:); c(6,:); c(2,:);
          c(4,:); c(6,:); c(3,:);
          c(1,:); c(5,:); c(1,:);
          
          c(3,:); c(6,:); c(4,:);
          c(4,:); c(5,:); c(5,:);
          c(1,:); c(1,:); c(2,:);
          
          c(6,:); c(4,:); c(5,:);
          c(3,:); c(2,:); c(4,:);
          c(6,:); c(2,:); c(4,:);
          
          c(1,:); c(1,:); c(5,:);
          c(2,:); c(1,:); c(3,:);
          c(5,:); c(2,:); c(2,:);];

end