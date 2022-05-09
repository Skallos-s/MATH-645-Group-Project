%generating a carrot
function carrot=MakeCarrot
carrot=[0;-1;.5;1;-.5;1;0;1;1;2;-1;2]; %defining vertices of the carrot
carrot=20*carrot; %scaling carrot
theta=randi(360)*2*pi/360; %defining a random angle
carrot=Duplicate([cos(theta) sin(theta); -sin(theta) cos(theta)],6)*carrot; %rotating the carrot
theta=randi(360)*2*pi/360; %defining a random angle
carrot=carrot+repmat([cos(theta)*50;sin(theta)*50],6,1); %placing it at the side of the bowl

end