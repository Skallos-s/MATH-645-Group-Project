% Splicing function to select mini animation.
% Takes in animation ID and index in whole animation.
% Plays chalenge screen and specific mini animation.
function s = PlayAnimation(j, a)

if a==1
    Challenge(j, "Flush Carrots", "Down a Toilet")
    s = Toilet();
end
if a==2
    Challenge(j, "Race", "Fishes")
    s = FishRacing();
end
if a==3
    Challenge(j, "Transform a", "Butterfly")
    s = Butterfly();
end
if a==4
    Challenge(j, "Figure", "Skating")
    s = FigureSkating();
end
if a==5
    Challenge(j, "Turn a Pumpkin", "Into a Carriage")
    s = PumpkinCarriage();
end
if a==6
    Challenge(j, "Dox", "Cinderella")
    s = Cinderella();
end
if a==7
    Challenge(j, "Bounce a", "Soccerball")
    s = SoccerBounce();
end
if a==8
    Challenge(j, "Escape a", "Monster")
    s = MysteryInc();
end
if a==9
    Challenge(j, "Learn About the", "Solar System")
    s = SolarSystem();
end
if a==10
    Challenge(j, "Observe a", "Black Hole")
    s = BlackHole();
end
if a==11
    Challenge(j, "Invent the", "Fourth Dimension")
    s = FourthDimension();
end
if a==12
    Challenge(j, "Solve a", "Rubik's Cube")
    s = RubiksCube();
end
if a==13
    Challenge(j, "Play", "Pachinko")
    s = Pachinko();
end
if a==14
    Challenge(j, "Ponder the", "ORB")
    s = Orb();
end

end