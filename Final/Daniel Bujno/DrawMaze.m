% Draw maze walls given input data.
% Input wall information, camera position and rotation, Field of View, wall
% colors, Debug option, string modifier, and animation index.
function DrawMaze(Walls, Camera, FoV, Colors, Debug, s, index)

% Set zoom level.
zoom = 3;

% Translate walls by camera coordinates.
% Rotate camera by the camera angle.
% Zoom in and also save the number of coordiantes in the wall matrix.
NewWalls = zoom * Duplicate(R2D(Camera(3)), 2) * (Walls-[Camera(1);Camera(2);Camera(1);Camera(2)]);
[~,x] = size(NewWalls);

% Scling value for display and matrix of FoV cone vectors.
scale = 3 * cot(FoV/2);
V = [1, -1; cot(FoV/2), cot(FoV/2)];

% Change floor and ceiling colors depending on string modifier.
switch s
    case "RUBIK"
        col1 = [0.5, 0.5, 0.5];
        col2 = [0.5, 0.5, 0.5];
    case "toilet"
        col1 = [165/256,165/256,165/256];
        col2 = [0, 0, 0.5];
    case "grass"
        col1 = [156/256,187/256,215/256];
        col2 = [124/255,169/255, 79/255];
    case "pumpkin"
        col1 = [0.5, 1, 0.5];
        col2 = [1, 0.5, 0];
    case "space"
        col1 = [0, 0, 0];
        col2 = [0, 0, 0];
    case "ice"
        col1 = [156/256,187/256,215/256];
        col2 = [156/256,187/256,215/256];
    otherwise
        col1 = [165/256,165/256,165/256];
        col2 = [114/256, 75/256, 52/256];
end

% Draw floor and ceiling.
fill([-3, 3, 3, -3], ...
     [0,0, 3, 3], col1)
hold on
fill([-3, 3, 3, -3], ...
     [0,0,-3,-3], col2)

% Flag to keep track of when walls are to be drawn.
NoWalls = true;

for iwall = 1:x
    % Index through each wall.
    wall = NewWalls(:,iwall);

    % A wall is sometimes visible if it is entirely in front of the camera,
    % that is, the y-coordinate for both vertices of the wall is positive.
    % However attempts to draw such a wall will not produce undesireable
    % effects.
    % If one vertex of the wall is in view, then the wall will always be
    % visible. However if the other vertex lies behind the camera, extra
    % care is needed to ensure undesireable effects do not occur.

    % Check if wall is in front of camera and safely draw the wall.
    isvisible = false; % Wall visibility flag.
    if (wall(2)>0.001) && (wall(4)>0.001)
        isvisible = true; % Set wall-specific flag.
        NoWalls = false; % Set all-walls flag.
        cwall = wall; % Set current wall variable.
    end

    % If a wall is not entirely in front of the camera, some work is needed.
    % If any one vertex is in view, we want it to be the first vertex.
    % Hence if the first vertex is not in view, we swap the two vertices.

    % The signs of the coordinates of b1 tell what qudrant, with respect to
    % the FoV cone vectors, the first vertex of the wall lies in.
    b1 = V\wall(1:2);
    if (b1(1)<=0) || (b1(2)<=0)
        wall = [wall(3);wall(4);wall(1);wall(2)];
        b1=V\wall(1:2);
    end

    % Once a swap was done, if necesary, if the possibly new vertex is not
    % in view, then the wall is not visible at all.
    if (b1(1)>=0) && (b1(2)>=0) && not(isvisible)
        isvisible = true; % Set wall-specific flag.
        NoWalls = false; % Set all-walls flag.
        % Check which FoV Cone vectors the wall intersects with.
        % Clamp the wall to what is on screen. This requires truncating a
        % wall at the point it intersects the FoV Cone vectors.
        if IsAbove(wall(1:2), wall(3:4))
            nwall = Clamp(wall(1:2), wall(3:4), V(:,1));
        else
            nwall = Clamp(wall(1:2), wall(3:4), V(:,2));
        end
        % Set current wall variable.
        cwall = [wall(1); wall(2); nwall(1); nwall(2)];
    end

    % If any wall is visible, isinvisible will be true.
    if isvisible
        % Calculate transformed coordinates of a wall to draw onscreen.
        % P1 and P2 are 1x3 vectors. First coordinate is the x-position on
        % screen. The second is the y-coordinate. The third is a modified
        % y-coordinate for the Toilet string modifer.
        P1 = scale * [cwall(1), 0.5, 0.5-index/400] / cwall(2);
        P2 = scale * [cwall(3), 0.5, 0.5-index/400] / cwall(4);

        % Toilet string modifer causes the bottom part of the floor to rise
        % up. In effect, it makes it look like the room is flooding.
        walcol = Colors(:,iwall);
        if s=="toilet"
            fill([P1(1), P2(1), P2(1), P1(1)], zoom * [-P1(2),-P2(2),-P2(3),-P1(3)],[0, 0, (1+walcol(3))/2]);
            fill([P1(1), P2(1), P2(1), P1(1)], zoom * [-P1(3),-P2(3), P2(2), P1(2)],walcol');
        else
            fill([P1(1), P2(1), P2(1), P1(1)], zoom * [-P1(2),-P2(2), P2(2), P1(2)],walcol');
        end

        % Debug 1.
        % Draw intro walls.
        if (iwall == x) && (Debug == 1)
            v1 = [-P2(1),-P2(1),-P1(1),-P1(1),P1(1),P1(1),P2(1),P2(1)];
            v2 = zoom*[1,-P2(2),-P2(2),P2(2),P2(2),-P2(2),-P2(2),1];
            fill(v1, v2, Colors(:,iwall)')
        end

        % Debug 2.
        % Draw bright fields in the outro.
        if (iwall == x) && (Debug == 2)
            fill([P1(1), P2(1), P2(1), P1(1)], zoom * [-P1(2),-P2(2), 0, 0],'g');
            fill([P1(1), P2(1), P2(1), P1(1)], zoom * [ 0, 0, P2(2), P1(2)],'c');
        end
    end
end

% Once no walls are in view, draw only the bright floor and sky.
if NoWalls && (Debug == 2)
    fill([-3,3,3,-3], [0,0, 3, 3], 'c')
    fill([-3,3,3,-3], [0,0,-3,-3], 'g')
end

% Reset axis.
axis([-3,3,-3,3])

end