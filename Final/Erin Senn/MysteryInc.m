% Monster Chase Mini Animation
function s = MysteryInc()
%Loading all the characters
%Velma 
CBv=imread('velma.png');
CBoutv=Jpeg2pointsConverter(CBv,220);
%Fred is getting the van
%Scooby Doo
CBsd=imread('scoobydoo.png');
CBoutsc=Jpeg2pointsConverter(CBsd,230);
%Shaggy
CBsh=imread('shaggy.png');
CBoutsh=Jpeg2pointsConverter(CBsh,220);
%Daphne
CBd=imread('daphne.jpeg');
CBoutd=Jpeg2pointsConverter(CBd,190);
%The monster
CBm=imread('monster.png');
CBoutm=Jpeg2pointsConverter(CBm,205);

%Inputing the background placing the characters in a haunted house
clf 
%ha = axes('units','normalized', 'position',[0 0 1 1]);
%uistack(ha,'bottom');
I=imread('background.jpeg');
%hi = imagesc(I);
colormap gray;
%set(ha,'handlevisibility','off', 'visible','off')

%The following for loops move the charicters so that they appear to run
%across the screen away from the monster chasing them
%Daphne running
Shiftd=[10*ones(1,12743);0*ones(1,12743)];
CBout2d=CBoutd;
for i=0:100
    image([0, 1000], [1000, 90], I)
    set(gca, 'YDir', 'normal');
    hold on
    plot(CBout2d(1,:),CBout2d(2,:),'m.');
    set(gca,'visible','off');
    axis([0,1000,90,1000]);
    pause(0.01);
    CBout2d=Shiftd+CBout2d;
    hold off
end
%Velma running
Shiftv=[10*ones(1,29913);0*ones(1,29913)];
CBout2v=CBoutv;
for i=0:200
    image([800, 2000], [1300, 20], I)
    set(gca, 'YDir', 'normal');
    hold on
    plot(CBout2v(1,:),CBout2v(2,:),'r.');
    set(gca,'visible','off');
    axis([800,2000,20,1300]);
    pause(0.01);
    CBout2v=Shiftv+CBout2v;
    hold off
end
%Scooby Doo running
Shiftsc=[10*ones(1,30171);0*ones(1,30171)];
CBout2sc=CBoutsc;
for i=0:200
    image([900, 1700], [1400, 375], I)
    set(gca, 'YDir', 'normal');
    hold on
    plot(CBout2sc(1,:),CBout2sc(2,:),'y.');
    set(gca,'visible','off');
    axis([900,1700,375,1400]);
    pause(0.01);
    CBout2sc=Shiftsc+CBout2sc;
    hold off
end

%Shaggy running
Shiftsh=[10*ones(1,17072);0*ones(1,17072)];
CBout2sh=CBoutsh;
for i=0:200
    image([800, 1600], [1200, 330], I)
    set(gca, 'YDir', 'normal');
    hold on
    plot(CBout2sh(1,:),CBout2sh(2,:),'g.');
    set(gca,'visible','off');
    axis([800,1600,330,1200]);
    pause(0.01);
    CBout2sh=Shiftsh+CBout2sh;
    hold off
end

%Monster chasing
Shiftm=[10*ones(1,6809);0*ones(1,6809)];
CBout2m=CBoutm;
for i=0:75
    image([350, 600], [500, -40], I)
    set(gca, 'YDir', 'normal');
    hold on
    plot(CBout2m(1,:),CBout2m(2,:),'w.');
    set(gca,'visible','off');
    axis([350,600,-40,500]);
    pause(0.02);
    CBout2m=Shiftm+CBout2m;
    hold off
end

vv = [93;165];
ExtraPts = vv*ones(1,50); 
CBextram = [CBoutm(:,1:50), ExtraPts, CBoutm(:,51:end)]; 

%The monster undergoes a reflection transformation making him "turn
%around"
A=[-1 0; 0 1];
CBtransform1=A*CBextram;
image([-500, 0], [400, -20], I)
set(gca, 'YDir', 'normal');
hold on
plot(CBtransform1(1,:),CBtransform1(2,:),'w.')
axis([-500,0,-20,400]);
set(gca,'visible','off');
pause(.5)
hold off

%The monster undergoes two expansion transformations (both vertical and
%horizontal enlarging the entire charicter) causing him to then move
%towards the viewer
B=[2 0; 0 2];
CBtransform2=B*CBextram;
image([0, 800], [1000, -50], I)
set(gca, 'YDir', 'normal');
hold on
plot(CBtransform2(1,:),CBtransform2(2,:),'w.');
axis([0,800,-50,1000]);
set(gca,'visible','off');
pause(0.2)
hold off

CBtransform3=B*CBtransform2;
image([200, 1000], [1000, 0], I)
set(gca, 'YDir', 'normal');
hold on
plot(CBtransform3(1,:),CBtransform3(2,:),'w.');
axis([200,1000,0,1000]);
set(gca,'visible','off');
pause(0.4)
hold off

s = "monster";

end
