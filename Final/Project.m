addpath(genpath('Ben Pollock'))
addpath(genpath('Daniel Bujno'))
addpath(genpath('Erin Senn'))
addpath(genpath('Joshua Calzadillas'))
addpath(genpath('Matt Kurr'))
addpath(genpath('Nivedha Thedsanamoorthy'))
% Intro animation.
MazeAnimationA(true, "")

% Number of mini animations.
%CL is the Challenge List.
MaxAnim = 14;
CL = 1:MaxAnim;

for j=1:MaxAnim
    % Randomly pick an value in CL that is not
    % the last value. If CL has one value left,
    % which will equal MAXANIM, then skip the
    % code and assign the animation ID to AnimID.
    l = length(CL);
    if l > 1
        % Pick a non-last index.
        % Obtain the animation ID.
        % Remove specific ID from CL.
        CLi = randi(l-1);
        AnimID = CL(CLi);
        CL = [CL(1:CLi-1), CL(CLi+1:l)];
    else
        AnimID = MaxAnim;
    end
    
    % Play animation, overlay checkmark, and turns screen off.
    % Pauses between each part.
    pause(0.2)
    s = PlayAnimation(j, AnimID);
    pause(0.3)
    Check()
    pause(0.5)
    ScreenOff()

    % If the last animation is playing, play outro animation.
    % Otherwise, play the interim animation with an effect
    % based off of the last animation played.
    if j==MaxAnim
        MazeAnimationB()
    else
        MazeAnimationA(false, s)
    end
    pause(0.1)
end
