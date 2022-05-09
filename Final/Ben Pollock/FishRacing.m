% Fish Racing Mini Animation
function s = FishRacing()
%imports images
tankback= imread("fishtank.png");
fish=imread('fish.png');
[x,y,~]=size(tankback);
%defines fish
fishpoints=Jpeg2pointsConverter(fish,220);
fish1=fishpoints+[450;0];
fish2=fishpoints+[450;100];
fish3=fishpoints+[450;200];
fish4=fishpoints+[450;300];
%the random shifts given to the fish during the race
shift1=[randi([-10;-1])/2;0];
shift2=[randi([-10;-1])/2;0];
shift3=[randi([-10;-1])/2;0];
shift4=[randi([-10;-1])/2;0];
%the start of the loop
frame=0;
while true
%adds a frame and also puts all of the images on the screen
frame=frame+1;
image([0, y], [x, 0], tankback);
set(gca, 'YDir', 'normal');
hold on
plot(fish1(1,:),fish1(2,:),'r.');
plot(fish2(1,:),fish2(2,:),'b.');
plot(fish3(1,:),fish3(2,:),'g.');
plot(fish4(1,:),fish4(2,:),'y.');
axis([0,y,0,x]);
pause(.05);
%the fish start to move by the random shifts defined previously
fish1=fish1+shift1;
fish2=fish2+shift2;
fish3=fish3+shift3;
fish4=fish4+shift4;
hold off
if frame==5
    %once it reaches 5 frames, a new shift is implemented and the frame
    %count restarts
    shift1=[randi([-10;-1])/2;0];
    shift2=[randi([-10;-1])/2;0];
    shift3=[randi([-10;-1])/2;0];
    shift4=[randi([-10;-1])/2;0];
    frame=0;
end
%for the next few sections, once the "min" or left side of the fish hit the
%end of the plot (which is 0 on the x-axis) the code breaks and stops it
%from continuing and displays who won
if min(fish1(1,:))<=0
    s="r";
    break
end
if min(fish2(1,:))<=0
    s="b";
    break
end
if min(fish3(1,:))<=0
    s="g";
    break
end
if min(fish4(1,:))<=0
    s="y";
    break
end
end
hold off

end