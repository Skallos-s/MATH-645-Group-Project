% Pumpkin Carriage Mini Animation
function s = PumpkinCarriage()
CB=imread('pumpkin.jpg');
 CBout = Jpeg2pointsConverter(CB,188);
 
 CB1=imread('carriage.png');
 CBout1= Jpeg2pointsConverter(CB1,135);

clf  
%ha = axes('units','normalized', 'position',[0 0 1 1]);
%uistack(ha,'bottom');
I=imread('cindbackground.jpg');
colormap gray
%set(ha,'handlevisibility','off', 'visible','off')

axis([-100 1500 0 1300])
vv = [1;2]; 
ExtraPts = vv*ones(1,25307);
CBextra = [CBout(:,1:2000), ExtraPts, CBout(:,2001:end)];  


vv1 = [1;70];
ExtraPts1 = vv1*ones(1,50);
CBextra1 = [CBout1(:,1:5000), ExtraPts1, CBout1(:,5000:end)];  


 coord=[100;200];
 coord1=[25;200];
 CB1_ref=CBextra1 -coord1;
 she=[1 1; 1 1/8];
 rot=[cos(pi/3) sin(pi/3); -sin(pi/3) cos(pi/3)];
for iii=0:1
    image([-100, 1500], [1300, 0], I)
    set(gca, 'YDir', 'normal');
    hold on
    plot(CBextra(1,:),CBextra(2,:),'y.')
    axis([-100 1500 0 1300])
    set(gca,'visible','off')
    pause(0.5)
    hold off
end 
for ii=0:1
    image([-100, 1500], [1300, 0], I)
    set(gca, 'YDir', 'normal');
    hold on
    ref_CB1=CBextra-coord;
    ref_CB1= she*ref_CB1;
    CBextra=ref_CB1+coord;
    plot(CBextra(1,:),CBextra(2,:),'y.')
    set(gca,'visible','off')
    axis([-100 1500 0 1300])
    pause(0.01)
    hold off
for i=0:1/5:1
    image([-100, 1500], [1300, 0], I)
    set(gca, 'YDir', 'normal');
    hold on
    ref_CB=CBextra-coord;
    ref_CB= rot*ref_CB;
    CBextra=ref_CB+coord;
    plot(CBextra(1,:),CBextra(2,:),'y.')
    set(gca,'visible','off')
    axis([-100 1500 0 1300])
    pause(0.01)
    hold off
end
end

%morph
for k=0:1/50:1
    image([-100, 1500], [1300, 0], I)
    set(gca, 'YDir', 'normal');
    hold on
    ref_CB=CBextra-coord;
    C = (k-1)*ref_CB + k*CB1_ref;
    %CBextraInscene=C+coord;
    plot(C(1,:),C(2,:),'y.')
    set(gca,'visible','off')
    axis([-100 1500 0 1300])
    pause(0.1)
    hold off
end

N=[10*ones(1,30103);0*ones(1,30103)];
CBextra1S=C;
%R=[1 0 30;0 1 i; 0 0 1];
for i=0:1/150:1
    image([-100, 1500], [1300, 0], I)
    set(gca, 'YDir', 'normal');
    hold on
    plot(CBextra1S(1,:),CBextra1S(2,:),'m.')
    set(gca,'visible','off')

    axis([-100 1500 0 1300])
    pause(0.1);
    CBextra1S=N+CBextra1S;
    hold off
end

s = "pumpkin";

end