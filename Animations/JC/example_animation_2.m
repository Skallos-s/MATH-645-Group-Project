% Author Joshua Calzadillas
% Example Animation 2
function result = exampleAnimation2()
    % Add animation Library
    addpath("../../")
    addpath("../../2DAML")

    % Literally Amogus
    % Amogus image taken from here:
    % https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fih1.redbubble.net%2Fimage.1730526491.0856%2Fst%2Csmall%2C507x507-pad%2C600x600%2Cf8f8f8.jpg&f=1&nofb=1
    amogus = jpg2Mat("amogus.jpg", 225);
    amogus = scaleObject(amogus, 0.005);
    amogus = centerObject(amogus);
    amogus2 = amogus; % Required
    amogus3 = amogus; % used later
    
    % Draw an Spiral
    spi = makeSpiral(3, pi/64, 4*pi);
    spi = scaleObject(spi, 0.5); % Can scale the spiral object to fit in the screen

    % Spiral Patterns
    spi2 = spi; % This is required in all animations (you must make a copy of original object)
    spi3 = -spi2;
    
    % sprial spinning
    plot(spi2(1,:), spi2(2,:))
    hold on
    plot(spi3(1,:), spi3(2,:))
    hold off

    % Rotating Spiral
    %
    thetas = 0:pi/64:2*pi;
    iterations = 2;
    for iter = 1:1:iterations
        for t = thetas
            % Rotate the spiral
            spi2 = rotateObject(spi, t);
            spi3 = -spi2;

            % sprial spinning
            plot(spi2(1,:), spi2(2,:))
            hold on
            plot(spi3(1,:), spi3(2,:))
            hold off

            pause(0.02)
        end
    end
    pause(2)

    % Put Amogus objects into the spiral paths
    iterations = 4;
    for iter = 1:1:iterations
        for t = 1:1:size(thetas,2)
            % Rotate the spiral
            spi2 = rotateObject(spi, t);
            spi3 = -spi2;

            % Rotate Amogus
            amogus2 = rotateObject(amogus2,  thetas(1,t));
            amogus3 = rotateObject(amogus2, -thetas(1,t));

            % Shift Amogus
            amogus2 = shiftImage(amogus, spi2(1,t), spi2(2,t));
            amogus3 = shiftImage(amogus, spi3(1,t), spi3(2,t));

            % sprial spinning
            plot(spi2(1,:), spi2(2,:), 'c')
            hold on
            plot(spi3(1,:), spi3(2,:), 'm')
            plot(amogus2(1,:), amogus2(2,:), 'r')
            plot(amogus3(1,:), amogus3(2,:), 'b')
            hold off

            pause(0.02)
        end
    end

    % This is a requirement for the project
%     result = rescaleTo3DAnimationAxis(eli2); % This must be included at the end of the animation
    result = 0;
end
