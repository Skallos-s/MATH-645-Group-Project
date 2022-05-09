% Toilet Mini Animation
function s = Toilet()
%import images
[toiletforeground, ~, alpha] = imread("toilet.png");
spiral = imread("spiral.png");
spiralpoints = Jpeg2pointsConverter(spiral, 50)-[100/2;100/2];
carrots=MakeCarrot;
[x,y,~]=size(toiletforeground);
%defining transformation vector and rotation matrix
Shift=[500/2;375/2];
M=[cos(-pi/16) sin(-pi/16);-sin(-pi/16) cos(-pi/16)];
R=Duplicate((M*.9),6);
%plotting everything
for j=0:300
%plotting and rotating the flush spiral
    fill([0,0,x,x], [0,y,y,0], 'b')
    hold on
    spiralpoints=M*spiralpoints;
    shiftspiral=spiralpoints+Shift;
    plot(shiftspiral(1,:), shiftspiral(2,:),'c.');
%drawing the carrots
    [~,numbercarrots]=size(carrots);
    for k=1:numbercarrots
        kc=carrots(:,k);
        kc=kc+repmat([500/2;375/2],6,1);
%coloring the carrots
        fill([kc(1),kc(3),kc(5)],[kc(2),kc(4),kc(6)],[1, 0.5, 0]);
        fill([kc(7),kc(9),kc(11)],[kc(8),kc(10),kc(12)],'g');
    end
%transforming the carrots   
    carrots=R*carrots;
%plotting the foreground ie toilet 
    image([0,y], [x,0], toiletforeground, 'AlphaData', alpha);
    axis([0,y,0,x]);
    pause(.05)
%creating and getting rid of carrots
    if mod(j,5)==0
%gets rid of a carrot after 20 frames
        if j>=20
            carrots=carrots(:,2:end);
        end
%makes new carrot
        carrots=[carrots MakeCarrot];
    end 
    hold off
end
s="toilet";

end