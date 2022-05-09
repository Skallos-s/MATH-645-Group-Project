% Figure Skating Mini Animation
function s = FigureSkating()
%load image in 
FS=imread('figureskater.jpeg');
FSout = [1 0;0 -1] * Jpeg2pointsConverter(FS,220);

%plot background 
clf  
IR=imread('icerink.jpeg');

%move character to center of background
FSout = moveToOrigin(FSout);

%figure skater skates onto rink (rescale, shift)
for k=0:10:800
    clf
    image(IR)
    set(gca,'visible','off');
    hold on;
	C = [0.3 0;0 0.3] * FSout + [0+k;550];
	plot(C(1,:),C(2,:),'k.')
    pause(0.00015);
end 

%figure skater spins (rescale, reflection)
for k=0:10
    clf
    image(IR)
    set(gca,'visible','off');
    hold on;
	C = [0.3 0;0 0.3] * [-1 0; 0 1] * FSout + [800;550];
	plot(C(1,:),C(2,:),'k.')
    pause(0.0001);
end

for k=0:10
    clf
    image(IR)
    set(gca,'visible','off');
    hold on;
	C = [0.3 0;0 0.3] * [1 0; 0 1] * FSout + [800;550];
	plot(C(1,:),C(2,:),'k.')
    pause(0.0001);
end

for k=0:10
    clf
    image(IR)
    set(gca,'visible','off');
    hold on;
	C = [0.3 0;0 0.3] * [-1 0; 0 1] * FSout + [800;550];
	plot(C(1,:),C(2,:),'k.')
    pause(0.0001);
end

for k=0:10
    clf
    image(IR)
    set(gca,'visible','off');
    hold on;
	C = [0.3 0;0 0.3] * [1 0; 0 1] * FSout + [800;550];
	plot(C(1,:),C(2,:),'k.')
    pause(0.0001);
end

for k=0:10
    clf
    image(IR)
    set(gca,'visible','off');
    hold on;
	C = [0.3 0;0 0.3] * [-1 0; 0 1] * FSout + [800;550];
	plot(C(1,:),C(2,:),'k.')
    pause(0.0001);
end

%figure skater does a jump (rescale, translation)
for k=-10:10
    clf
    image(IR)
    set(gca,'visible','off');
    hold on;
	C = [0.3 0;0 0.3] * FSout + [800;550] + [0;k^2-100];
	plot(C(1,:),C(2,:),'k.')
    pause(0.00000015);
end

for k=0:10
    clf
    image(IR)
    set(gca,'visible','off');
    hold on;
	C = [0.3 0;0 0.3] * FSout + [800;550] + [0;0];
	plot(C(1,:),C(2,:),'k.')
    pause(0.05);
end

%figure skater skates off rink (rescale, shift)
for k=0:10:2000
    clf
    image(IR)
    set(gca,'visible','off');
    hold on;
	C = [0.3 0;0 0.3] * FSout + [800+k;550];
	plot(C(1,:),C(2,:),'k.')
    pause(0.00015);
end


s = "ice";

end