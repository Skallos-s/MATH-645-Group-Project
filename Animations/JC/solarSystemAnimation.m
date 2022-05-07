% Author Joshua Calzadillas
function result = solarSystemAnimation()
    % Add animation Library
    addpath("../../2DAML")
    
    % Planets
    mercury = makeCircle(0.5 * 4.879, pi/64);   % Mercury
    venus = makeCircle(0.5 * 12.104, pi/64);    % Venus
    earth = makeCircle(0.5 * 12.756, pi/64);    % Earth
    mars = makeCircle(0.5 * 6.792, pi/64);      % Mars
    sun  = makeCircle(0.5 * 69.6, pi/64);

    % We wont do the other planets since some of them are soo big, it will
    % cause problems with the scaling and visibility of each of the other
    % planets
    planets = [mercury; venus; earth; mars];   % Object list of planets
    planetColors = ['r' 'c' 'g' 'm'];
    PCSize = size(planetColors, 2);


    % Orbital Paths
    % eccentricity values
    mer_ecen = 0.206;   % Mercury
    ven_ecen  = 0.007;  % Venus
    ear_ecen  = 0.017;  % Earth
    mar_ecen  = 0.094;  % Mars

    % Distance from sun
    % 10^-7 km
    mer_dist = 57.9;    % Mercury
    ven_dist = 108.2;   % Venus
    ear_dist = 147.1;   % Earth
    mar_dist = 206.7;   % Mars

    % based on average distance (a & b) and ececntricity (c/a) find b
    mer_b = sqrt(mer_dist^2 - (mer_ecen * mer_dist)^2);    % Mercury
    ven_b = sqrt(ven_dist^2 - (ven_ecen * ven_dist)^2);    % Venus
    ear_b = sqrt(ear_dist^2 - (ear_ecen * ear_dist)^2);    % Earth
    mar_b = sqrt(mar_dist^2 - (mar_ecen * mar_dist)^2);    % Mars

    % Planetary Orbital Path
    mercuryPath = makeEllipse(mer_dist, mer_b, pi/32);     % Mercury
    venusPath = makeEllipse(ven_dist, ven_b, pi/32);       % Venus
    earthPath = makeEllipse(ear_dist, ear_b, pi/32);       % Earth
    marsPath = makeEllipse(mar_dist, mar_b, pi/32);        % Mars

    % Plotting Oribtal Paths
    orbitalPaths = [mercuryPath; venusPath; earthPath; marsPath];
    orbitalColors = ['r' 'c' 'g' 'm'];
    OCSize = size(orbitalColors, 2);
    objectPlot(orbitalPaths, orbitalColors);

    % Orbiting Animation
    orbitalPathSize = size(mercuryPath, 2);
    %thetas = 0:pi/(orbitalPathSize):(2*pi+pi/orbitalPathSize);
    runTimes = 2;
    axisSize  = 250;
    spaceSize = 2 * axisSize;
    space = makeSquare(spaceSize); % Space
    space = centerObject(space);

    % Increment path
    % Mercury
    mercuryPathMarker = 1:1:size(mercuryPath,2);
    mercuryPathMarker = floor((4.74/2.98) * mercuryPathMarker);
    sMPM = size(mercuryPathMarker, 2);

    % Venus
    venusPathMarker   = 1:1:size(venusPath,2);
    venusPathMarker = floor((3.5/2.98) * venusPathMarker);

    % Earth
    earthPathMarker   = 1:1:size(earthPath,2);

    % Mars
    marsPathMarker   = 1:1:size(marsPath,2);
    marsPathMarker = floor((2.41/2.98) * marsPathMarker)+1;
    mMpm = size(marsPath, 2);



    % Planet
    planetXCords = objectXCords(planets);
    pXSize = size(planetXCords, 2);
    orbitXCords = objectXCords(orbitalPaths);
    oXSize = size(orbitXCords, 2);
    for rt = 1:1:runTimes
        for k = 1:1:orbitalPathSize
            % Transformations on planets
            planets(1:2,:) = shiftImage(mercury, mercuryPath(1, mod(mercuryPathMarker(1, k), sMPM) + 1), mercuryPath(2, mod(mercuryPathMarker(1, k), sMPM) + 1));
            planets(3:4,:) = shiftImage(venus, venusPath(1, mod(venusPathMarker(1, k), sMPM) + 1), venusPath(2, mod(venusPathMarker(1, k), sMPM) + 1));
            planets(5:6,:) = shiftImage(earth, earthPath(1, mod(earthPathMarker(1, k), sMPM) + 1), earthPath(2, mod(earthPathMarker(1, k), sMPM) + 1));
            planets(7:8,:) = shiftImage(mars, marsPath(1, mod(marsPathMarker(1, k), mMpm) + 1), marsPath(2, mod(marsPathMarker(1, k), mMpm) + 1));
            pause(0.01)


            % Plot Space
            fill(space(1,:), space(2,:), 'k');
            
            
            % Orbital Path Mapping
            hold on
            % Plot Orbital Paths
            plot(orbitalPaths(1,:), orbitalPaths(2,:), "Color",  orbitalColors(1, 4));
            plot(orbitalPaths(3,:), orbitalPaths(4,:), "Color",  orbitalColors(1, 3));
            plot(orbitalPaths(5,:), orbitalPaths(6,:), "Color",  orbitalColors(1, 2));
            plot(orbitalPaths(7,:), orbitalPaths(8,:), "Color",  orbitalColors(1, 1));

            % Plot Planets
            fill(planets(1,:), planets(2,:), planetColors(1, 4));
            fill(planets(3,:), planets(4,:), planetColors(1, 3));
            fill(planets(5,:), planets(6,:), planetColors(1, 2));
            fill(planets(7,:), planets(8,:), planetColors(1, 1));
            fill(sun(1,:), sun(2,:), 'y');
            hold off

            % Plot Objects
            axis([-axisSize axisSize -axisSize axisSize]);
            pause(0.03)
        end
        pause(0.01)
    end

    % This is a requirement for the project
%     result = rescaleTo3DAnimationAxis(eli2); % This must be included at the end of the animation
    result = 0;
end
