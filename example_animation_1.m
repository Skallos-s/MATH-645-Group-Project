% Author Joshua Calzadillas
% Example Animation 1
function result = exampleAnimation1()
    % Add animation Library
    addpath("./2DAML")
    
    % Draw an ellipse
    eli = makeEllipse(2, 5, pi/8); % Object that is centered around the origin (Leave this one alone)
    eli2 = eli; % copy used for animation (This is a must)
    
    % This is not requried, I thought it was cool
    pause(1)
    title("3...")
    pause(1)
    title("2...")
    pause(1)
    title("1...")
    pause(1)

    % That way you can always set it back to the original position (origin)
    eli2 = eli;
    % this is defined to make the animation smoother
    eli3 = 0.5 * eli2;
    eli4 = 2 * eli2;

    % Rotate Ellipse and Shift it around in a circle
    objectPath = makeCircle(25, 0.1);
    objectMinorPath = 0.5 * objectPath;
    objectMajorPath = 2 * objectPath;
    thetas = 0:(pi / (size(objectPath, 2))):(2*pi+pi/32);
    thetas = thetas * 4;
    axisSize = 75;

    % Orbiting Animation
    % Note don't do too many calculations
    % Have all of the calculations done before you plot the animations
    for k = 1:1:size(objectPath,2)
        % Apply Transformations
        eli2 = rotateObject(eli, thetas(1,k)); % Notice how the transformations are done to the original object
        eli2 = shiftImage(eli2, objectPath(1,k), objectPath(2,k)); % This transformation rotates the previous object

        % this is defined to make the animation smoother
        eli3 = 0.5 * eli2;
        eli4 = 2 * eli2;
        
        % Plot the system
        plot(objectPath(1,:), objectPath(2,:), 'c')
        hold on
        % Maximum number of orbits as of this moment is applied here
        axis([-axisSize axisSize -axisSize axisSize])
        plot(objectMinorPath(1,:), objectMinorPath(2,:), 'm')
        plot(objectMajorPath(1,:), objectMajorPath(2,:), 'k')
        fill(eli3(1,:), eli3(2,:), 'r')
        fill(eli2(1,:), eli2(2,:), 'b')
        fill(eli4(1,:), eli4(2,:), 'g')
        hold off
        pause(0.05)
    end

    % This is a requirement for the project
%     result = rescaleTo3DAnimationAxis(eli2); % This must be included at the end of the animation
    result = 0;
end
