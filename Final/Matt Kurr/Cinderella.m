% Cinderall Trnsformation Mini Animation
function s = Cinderella()
 CB=imread('cinderella1.png');
 CBout = Jpeg2pointsConverter(CB,72);

  CB1=imread('cinderella_after.png');
 CBout1= Jpeg2pointsConverter(CB1,130);

 clf  
%ha1 = axes('units','normalized', 'position',[0 0 1 1]);
%uistack(ha1,'bottom');
I=imread('cindsparkle.jpg');
%hi = imagesc(I);
colormap gray
%set(ha1,'handlevisibility','off', 'visible','off')

vv = [1;2]; 
ExtraPts = vv*ones(1,1);
CBextraY = [CBout(:,1:50), ExtraPts, CBout(:,51:end)];  
plot(CBextraY(1,:),CBextraY(2,:),'w.') 

vv1 = [1;70];
ExtraPts1 = vv1*ones(1,45865);
CBextra1Y = [CBout1(:,1:5000), ExtraPts1, CBout1(:,5001:end)];  


coord=[-100;-100];
 coord1=[50;200];
 CB11_ref=CBextra1Y -coord1;
 refl=[0 1;1 0];
 refl2=[1 0;0 -1];
 rot=[cos(pi/20) sin(pi/20); -sin(pi/20) cos(pi/20)];

 for iii=0:1
    image([-1200, 1200], [1200, -1200], I)
    set(gca, 'YDir', 'normal');
    hold on
    plot(CBextraY(1,:),CBextraY(2,:),'w.')
    axis([-1200 1200 -1200 1200])
    set(gca,'visible','off')
    pause(0.5)
    hold off
end 
for ii=0:1/6:1
    image([-1200, 1200], [1200, -1200], I)
    set(gca, 'YDir', 'normal');
    hold on
    ref_CB1=CBextraY-coord;
    ref_CB1= refl*ref_CB1;
    CBextraY=ref_CB1+coord;
    plot(CBextraY(1,:),CBextraY(2,:),'m.')
    set(gca,'visible','off')
    axis([-1200 1200 -1200 1200])
    pause(0.1)
    hold off

    image([-1200, 1200], [1200, -1200], I)
    set(gca, 'YDir', 'normal');
    hold on
    ref_CB=CBextraY-coord;
    ref_CB= rot*ref_CB;
    CBextraY=ref_CB+coord;
    plot(CBextraY(1,:),CBextraY(2,:),'r.')
    set(gca,'visible','off')
    axis([-1200 1200 -1200 1200])
    pause(0.1)
    hold off

    image([-1200, 1200], [1200, -1200], I)
    set(gca, 'YDir', 'normal');
    hold on
    ref_CB=CBextraY-coord;
    ref_CB= refl2*ref_CB;
    CBextraY=ref_CB+coord;
    plot(CBextraY(1,:),CBextraY(2,:),'g.')
    set(gca,'visible','off')
    axis([-1200 1200 -1200 1200])
    pause(0.1)
    hold off
end


%morph
for k=0:1/25:1
    image([-100, 1000], [700, -100], I)
    set(gca, 'YDir', 'normal');
    hold on
    ref_CB=CBextraY-coord;
    C = (k-1)*ref_CB + k*CB11_ref;
    %CBextraInscene=C+coord;
    plot(C(1,:),C(2,:),'c.')
    set(gca,'visible','off')
    axis([-100 1000 -100 700])
    pause(0.1)
    hold off
end

s = "pumpkin";

end