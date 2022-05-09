% Pachinko Mini Animation
function win = Pachinko()

% Axes, animation index, color, and shuffling of colors.
axes = [-4,4,-4,4];
t = 0;
cols = ['r', 'g', 'b', 'y'];
cols = cols(randperm(4));

% Box coordinates.
cbox = [-4,-2,-2,-4; -4,-4,-2,-2];

% Ball data.
balc = [0.2*(rand(1,1)-0.5);3]; % Position.
balv = [0;0]; % Velocity.
bala = [0;-0.01]; % Acceleration.
balr = 0.2; % Radius.

% Static peg locations.
peg3 = [0.2*(rand(1,1)-0.5) + (-3:3); -ones(1,7)];
pegr = 0.2; % Peg radius.

% Sine and Cosine list for drawing circles.
c = 0.2 * cos(0:pi/8:2*pi);
s = 0.2 * sin(0:pi/8:2*pi);

active = true;  % Animation Active Flag.
caught = false; % Ball Is Caught Flag.

% Play until the ball is caught and off-screen.
while active
    % Moving peg locations.
    peg1 = [(-6:2:4)+rem(t,20)/10;
            ones(1,6)];
    peg2 = [(-4:2:6)-rem(t,20)/10;
            zeros(1,6)];
    
    % New Peg Matrix.
    pegs = [peg1, peg2, peg3];
    n = length(pegs); %Number of Pegs. (Constant)
    
    % Backdrop.
    fill([-4,4,4,-4], [-4,-4,4,4], [0.75,0.75,0.75])
    hold on

    % Moving color bins.
    fill(cbox(1,:)+rem(t,20)/10-2, cbox(2,:), cols(4));
    fill(cbox(1,:)+rem(t,20)/10+0, cbox(2,:), cols(1));
    fill(cbox(1,:)+rem(t,20)/10+2, cbox(2,:), cols(2));
    fill(cbox(1,:)+rem(t,20)/10+4, cbox(2,:), cols(3));
    fill(cbox(1,:)+rem(t,20)/10+6, cbox(2,:), cols(4));
    
    % Draw pegs.
    for j=1:n
        fill(pegs(1,j)+c, pegs(2,j)+s, [0.5,0.5,0.5])
        
        % If the ball hits a peg, reflect velocity.
        df = pegs(:,j)-balc;
        if norm(df) <= balr+pegr
            balv = Reflect(balv, df);
        end
    end

    % If the ball is not caught and hits the walls, reflect.
    if (~ caught) && ((balc(1) >= 4) || (balc(1) <= -4))
        balv(1) = -balv(1);

        % Reset position to edge of wall
        if balc(1) >= 4
            balc(1) = 4;
        end
        if balc(1) <= -4
            balc(1) = -4;
        end
    end

    % If the ball hits a bin, change acceleration and velocity to have ball
    % slowly sink to center of bin.
    if (~ caught) && (balc(2) <= -2)
        bala = [0;0];
        balv = [1/10;-0.1];
        caught = true; % Set Caught flag to true.
        % Calculate color of bin the ball fell in.
        win = cols(1+mod(floor((4+balc(1)-rem(t,20)/10)/2),4));
    end

    % Once the ball reaches the center, vertically, of a bin, keep it
    % still.
    if balc(2) <= -3
        balv = [1/10;0];
    end

    % Once the ball is caught and off screen, set Active flag to false.
    if caught && (balc(1) >= 5)
        active = false;
    end

    % Draw ball.
    fill(balc(1)+c, balc(2)+s, 'k')
    
    % Update ball velocity and position.
    balc = balc + balv;
    balv = balv + bala;

    % Increment animation index.
    t = t + 1;
    if rem(t,20)==0
        cols = [cols(4), cols(1:3)];
    end
    
    % Update Axes
    axis(axes)
    pause(0.01)
    hold off
end

end