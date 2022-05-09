% Solar System Mini Animation
% Author Joshua Calzadillas
function s = SolarSystem()
    
    % Planets
    % Planet Fact Sheet
    % https://nssdc.gsfc.nasa.gov/planetary/factsheet/index.html
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
    %PCSize = size(planetColors, 2);

    % Showcase the planets
    pause(0.5)
    bigMercury = mercury * 10^3; % in terms of Km
    space = centerObject(makeSquare(140000));
    
    % Plot Space with mercury
    fill(space(1,:), space(2,:), 'k')
    hold on
    fill(bigMercury(1,:), bigMercury(2,:), 'm')
    title("Mercury Planet Scale")
    xlabel("Km")
    ylabel("Km")
    axis([-12000 12000 -12000 12000])
    hold off
    disp("Please Wait 2 Seconds")
    pause(2)
    
    % Scale down animation
    ScaleDownFactor = 0.1;
    axisSize = 12000;
    for k = 1:1:3
        bigMercury = [ScaleDownFactor 0; 0 ScaleDownFactor] * bigMercury;
        fill(space(1,:), space(2,:), 'k')
        hold on
        fill(bigMercury(1,:), bigMercury(2,:), 'm')
        title("Mercury Planet Scale")
        xlabel("Km")
        ylabel("Km")
        axis([-axisSize axisSize -axisSize axisSize])
        hold off
        pause(1)
    end

    % Zoom In Effect to 1000
    for k = 1:1:11
        axisSize = 12000 - (1000 * k);
        hold on
        axis([-axisSize axisSize -axisSize axisSize])
        hold off
        pause(0.1)
    end
    clear bigMercury
    axisSize = 12;
    fill(space(1,:), space(2,:), 'k')
    hold on
    fill(mercury(1,:), mercury(2,:), 'm')
    title("Mercury Planet Scale")
    xlabel("Km^-3")
    ylabel("Km^-3")
    axis([-axisSize axisSize -axisSize axisSize])
    hold off
    pause(3)

    % Rotation Transformation

    % Plot initial state 
    clear space
    MercOrbPos = centerObject(makeRectangle(8,0.5 * 4.879));
    space = centerObject(makeSquare(25));
    fill(space(1,:), space(2,:), 'k')
    hold on
    fill(mercury(1,:), mercury(2,:), 'm')
    fill(MercOrbPos(1,:), MercOrbPos(2,:), 'g')
    title("Mercury Planet Rotate")
    xlabel("Km^-3")
    ylabel("Km^-3")
    axis([-axisSize axisSize -axisSize axisSize])
    hold off
    pause(2)
    
    % Rotation Transformation Sequence
    %mercOrbPos = MercOrbPos;
    disp("Mercury Rotates around itself once every 4222.6 hours or once every " + (4222.6/24) + " days")
    for k = 1:pi/64:(2 * pi + pi/64)
        % Transform
        mercOrbPos = rotateObject(MercOrbPos, k);

        % Plot
        fill(space(1,:), space(2,:), 'k')
        hold on
        fill(mercury(1,:), mercury(2,:), 'm')
        fill(mercOrbPos(1,:), mercOrbPos(2,:), 'g')
        title("Mercury Planet Rotate")
        xlabel("Km^-3")
        ylabel("Km^-3")
        axis([-axisSize axisSize -axisSize axisSize])
        hold off
        pause(0.05)
    end
    pause(2)
    % Cleanup
    clear mercOrbPos
    clear MercOrbPos
    clear axisSize
    clear space
    disp("Now Doing Orbital Mechanics Animation")


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
    %OCSize = size(orbitalColors, 2);
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
    %planetXCords = objectXCords(planets);
    %pXSize = size(planetXCords, 2);
    %orbitXCords = objectXCords(orbitalPaths);
    %oXSize = size(orbitXCords, 2);

    % Initial Plot
    % Plot Space
    fill(4 * space(1,:), 4 * space(2,:), 'k');
    
    
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
    legend(["Space", "Mercury Orbit", "Venus Orbit", "Earth Orbit", "Mars Orbit", "Mercury", "Venus", "Earth", "Mars", "Sun"])
    title("Orbital Mechanics of Planets Animation")
    hold off
    pause(5)
    

    % Animation Plot
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
            title("Orbital Animation")
            xlabel("Km^-3")
            ylabel("Km^-3")
            pause(0.03)
        end
        pause(0.01)
    end

    % This is a requirement for the project
    s = "space";
end