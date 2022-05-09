%Butterfly Transformation Mini Animation
function s = Butterfly()
%load images in 
CP=imread('caterpillar.jpeg');
CPout = [1 0;0 -1] * Jpeg2pointsConverter(CP,220);

BF=imread('butterfly.jpeg');
BFout = [1 0;0 -1] * Jpeg2pointsConverter(BF,45);

%plot background 
clf  
I=imread('naturebckgrnd.jpeg');

%add extra points to butterfly 
vv = [60;20];
ExtraPts = vv*ones(1,size(CPout,2)-size(BFout,2));
BFextra = [BFout(:,1:12356), ExtraPts, BFout(:,12357:end)];

%move characters to center of background
CPout = moveToOrigin(CPout);
BFextra = moveToOrigin(BFextra);

%caterpillar
for k=1:10
    clf
    image(I)
    set(gca,'visible','off');
    hold on;
	C = CPout + [300;200] ; 
	plot(C(1,:),C(2,:),'y.')
    pause(0.05);
end

%morph caterpillar --> butterfly
for k=0:1/50:1
    clf
    image(I)
    set(gca,'visible','off');
    hold on;
	C = (1-k)*CPout + k*BFextra + [350;200];
	plot(C(1,:),C(2,:),'y.')
    pause(0.05);
end

%butterly flies off screen (via shifts in a loop)
for k=0:10:400
    clf
    image(I)
    set(gca,'visible','off');
    hold on;
	C = BFextra + [350+k;200];
	plot(C(1,:),C(2,:),'y.')
    pause(0.05);
end

%butterly comes back on screen (via shifts in a loop)
for k=0:10:300
    clf
    image(I)
    set(gca,'visible','off');
    hold on;
	C = BFextra + [0+k;200];
	plot(C(1,:),C(2,:),'y.')
    pause(0.05);
end

%butterfly flutters wings (via shear loops)
for k=1:10
    clf
    image(I)
    set(gca,'visible','off');
    hold on;
    Shear = [1 0;sin(pi/4) 1];
	C = Shear * BFextra + [300;200] ; 
	plot(C(1,:),C(2,:),'y.')
    pause(0.05);
end

for k=1:10
    clf
    image(I)
    set(gca,'visible','off');
    hold on;
    Shear = [1 0;-sin(pi/4) 1];
	C = Shear * BFextra + [300;200] ; 
	plot(C(1,:),C(2,:),'y.')
    pause(0.05);
end

for k=1:10
    clf
    image(I)
    set(gca,'visible','off');
    hold on;
    Shear = [1 0;sin(pi/4) 1];
	C = Shear * BFextra + [300;200] ; 
	plot(C(1,:),C(2,:),'y.')
    pause(0.05);
end

for k=1:10
    clf
    image(I)
    set(gca,'visible','off');
    hold on;
    Shear = [1 0;-sin(pi/4) 1];
	C = Shear * BFextra + [300;200] ; 
	plot(C(1,:),C(2,:),'y.')
    pause(0.05);
end

for k=1:10
    clf
    image(I)
    set(gca,'visible','off');
    hold on;
    Shear = [1 0;sin(pi/4) 1];
	C = Shear * BFextra + [300;200] ; 
	plot(C(1,:),C(2,:),'y.')
    pause(0.05);
end

s = "grass";

end