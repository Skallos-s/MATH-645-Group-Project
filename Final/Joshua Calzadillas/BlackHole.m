% Black Hole Mini Animation
% Author Joshua Calzadillas
% This is just a cool animation of 
function s = BlackHole()
    %clf
    clf
    % Add animation Library
    addpath("../../2DAML")
    
    % Black Hole
    blackHole = makeCircle(0.5 * 5.8, pi/64); % random black hole
    gravitationalOrbitalPath = makeSpiral(2, pi/64, 4 * pi + pi/64);
    axisSize = 50;

    % Plot the blackhole and the gravitational oribtal path
    space = makeSquare(100);
    
    % Initial Plot
    fill(space(1,:), space(2,:), 'k')
    hold on
    %
    plot(blackHole(1,:), blackHole(2,:), 'w')
    fill(gravitationalOrbitalPath(1,:), gravitationalOrbitalPath(2,:), 'c')
    title("Let's Fix this...")
    hold off
    pause(4)

    % Fixed initial Plot =)
    space = centerObject(space);
    %gravitationalOrbitalPath = [0.5 0; 0 0.5] * gravitationalOrbitalPath; % Scaled down transformation

    % Initial Plot
    fill(space(1,:), space(2,:), 'k')
    hold on
    %
    plot(gravitationalOrbitalPath(1,:), gravitationalOrbitalPath(2,:), 'c')
    fill(blackHole(1,:), blackHole(2,:), 'w')
    title("Let's Fix this...")
    axis([-axisSize axisSize -axisSize axisSize])
    pause(2)
    title("Now that is better")
    hold off
    pause(3)

    % Shapes and Copies
    GOP = gravitationalOrbitalPath;
    GOPSize = size(GOP, 2);
    circ = centerObject(makeCircle(250, pi/64));
    sqar = centerObject(makeSquare(2.5));
    rect = centerObject(makeRectangle(2.5, 5));
    eli  = centerObject(makeEllipse(2.5, 5, pi/64));
    circ = scaleObject(circ, 0.01);

    % Scaled down version of the image
    %amogus1 = circ;
    %amogus2 = sqar;
    %amogus3 = rect;
    %amogus4 = eli;

    % Movment Pace

    % Path 1
    a1Path = floor((4.74/2.98) * GOPSize:-1:1); % Same speed rate as Mercury in the previous animation
    a1PSize = size(a1Path,2);

    % Path 2
    a2Path = floor((3.5/2.98) * GOPSize:-1:1); % Same speed rate as Venus in the previous animation
    a2PSize = size(a2Path,2);

    % Path 3
    a3Path = GOPSize:-1:1; % Same speed rate as Earth in the previous animation
    a3PSize = size(a3Path,2);

    % Path 4
    a4Path = floor((2.41/2.98) * GOPSize:-1:1); % Same speed rate as Mars in the previous animation
    a4PSize = size(a4Path,2);

    % Plot Background
    % Background Image
    % https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmediad.publicbroadcasting.net%2Fp%2Fshared%2Fnpr%2Fstyles%2Fx_large%2Fnprshared%2F201904%2F711739026.jpg&f=1&nofb=1
    % Load background here
    ha = axes('units','normalized', 'position',[0 0 1 1]);
    I = imread("blackHole.jpg");
    set(ha,'handlevisibility','on', 'visible','on')
    %hi = imagesc(I);
    pause(2)

    
    % Iteration based for loop (nested)
    for times = 1:1:2
        for k = 1:1:GOPSize
            % Amogus 1 Transformations
            amogus1 = scaleObject(circ, (GOPSize - k)/GOPSize); % Scaleing down
            amogus1 = [1 0.0002; 0 1] * amogus1;
            amogus1 = shiftImage(amogus1, GOP(1, mod(a1Path(1,mod(k,a1PSize - 1) + 1), GOPSize) + 1), GOP(2, mod(a1Path(1,mod(k,a1PSize - 1) + 1), GOPSize) + 1));
            
            % Amogus 2 Transformations
            amogus2 = rotateObject(sqar, (k * 2 * pi/64));
            amogus2 = scaleObject(amogus2, (GOPSize - k)/GOPSize); % Scaleing down
            amogus2 = [1 0.0002; 0 1] * amogus2;
            amogus2 = shiftImage(amogus2, GOP(1, mod(a2Path(1,mod(k,a2PSize - 1) + 1), GOPSize) + 1), GOP(2, mod(a2Path(1,mod(k,a2PSize - 1) + 1), GOPSize) + 1));

            % Amogus 3 Transformations
            amogus3 = rotateObject(rect, (k * 2 * pi/64));
            amogus3 = scaleObject(amogus3, (GOPSize - k)/GOPSize); % Scaleing down
            amogus3 = [1 0.0002; 0 1] * amogus3;
            amogus3 = shiftImage(amogus3, GOP(1, mod(a3Path(1,mod(k,a3PSize-1) + 1), GOPSize) + 1), GOP(2, mod(a3Path(1,mod(k,a3PSize-1) + 1), GOPSize) + 1));

            % Amogus 4 Transformations
            amogus4 = rotateObject(eli, (k * 2 * pi/64));
            amogus4 = scaleObject(amogus4, (GOPSize - k)/GOPSize); % Scaleing down
            amogus4 = [1 0.0002; 0 1] * amogus4;
            amogus4 = shiftImage(amogus4, GOP(1, mod(a4Path(1,mod(k,a4PSize-1) + 1) + 1,  GOPSize)), GOP(2, mod(a4Path(1,mod(k,a4PSize-1) + 1) + 1, GOPSize)));

            % Plot Animation Sequence
            image([-200, 200], [70, -100], I);
            hold on

            % Plot the Amogus
            fill(amogus1(1,:), amogus1(2,:), 'r')
            fill(amogus2(1,:), amogus2(2,:), 'c')
            fill(amogus3(1,:), amogus3(2,:), 'y')
            fill(amogus4(1,:), amogus4(2,:), 'g')
            
            % Plot the Orbital Path
            plot(GOP(1,:), GOP(2,:), 'c')

            % Plot the Hole
            %fill(blackHole(1,:), blackHole(2,:), 'w')
            axis([-axisSize axisSize -axisSize axisSize])
            hold off
            pause(0.01)
        end
    end

    % Required
    s = "space";
end