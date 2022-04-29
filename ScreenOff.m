function ScreenOff()

for j=3:-0.3:0
    Star = [-3*j,-j,0,j,3*j,j,0,-j; 0,j,3*j,j,0,-j,-3*j,-j];
    fill([-3,3,3,-3],[-3,-3,3,3],'k')
    hold on
    fill(Star(1,:),Star(2,:),'w')
    axis([-3,3,-3,3])
    hold off
    pause(0.001)
end