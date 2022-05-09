% Soccer Mini Animation
function s = SoccerBounce()
%Loading the soccer ball
CB=imread('soccerball.png');
CBout=Jpeg2pointsConverter(CB,220);

axis([-700,1500,-1200,1100]);

vv = [93;165];
ExtraPts = vv*ones(1,50); 
CBextra = [CBout(:,1:50), ExtraPts, CBout(:,51:end)];  

%Incorporating the background of a stadium
clf 
%ha = axes('units','normalized', 'position',[0 0 1 1]);
%uistack(ha,'bottom');
I=imread('field.jpeg');
%hi = imagesc(I);
colormap gray
%set(ha,'handlevisibility','off', 'visible','off')

%Within this for loop the soccer ball shifts up and down undergoing both
%vetical and horizonal expansion transformations to create the illusion of it hitting the
%ground and bouncing back up
for j=0:2
    
Shift=[0*ones(1,210128);-40*ones(1,210128)];
CBout2=CBout;
for i=0:50
    image([-1700, 1100], [600, -2000], I)
    set(gca, 'YDir', 'normal');
    hold on
    plot(CBout2(1,:),CBout2(2,:),'k.');
    set(gca,'visible','off');
    axis([-1700,1100,-2000,600]);
    pause(0.05);
    CBout2=Shift+CBout2;
    hold off
end

vc=[4 0; 0 1];
CBtransform=vc*CBextra;
image([-5000, 4000], [4000, 0], I)
set(gca, 'YDir', 'normal');
hold on
plot(CBtransform(1,:),CBtransform(2,:),'k.')
axis([-5000,4000,0,4000]);
set(gca,'visible','off');
pause(0.2)
Shift=[0*ones(1,210128);40*ones(1,210128)];
CBout2=CBout;
for i=0:30
    image([-1400, 1100], [2000, 0], I)
    set(gca, 'YDir', 'normal');
    hold on
    plot(CBout2(1,:),CBout2(2,:),'k.');
    set(gca,'visible','off');
    axis([-1400,1100,0,2000])
    pause(0.01);
    CBout2=Shift+CBout2;
    hold off
end
end

r=[cos(pi/32),sin(pi/32); -sin(pi/32), cos(pi/32)];
for i=0:20
    image([-1700, 1100], [600, -2000], I)
    set(gca, 'YDir', 'normal');
    hold on
    CBtransform2=r*CBextra;  
    plot(CBtransform2(1,:),CBtransform2(2,:),'k.')
    set(gca,'visible','off');
    CBextra=CBtransform2;
    pause(.05)
end

s = "grass";
