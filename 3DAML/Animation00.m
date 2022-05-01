function Animation00()

%Rainbow Icosahedron

[data,leng] = Icosahedron(1);
col = hsv(360);

for j=0:2:360
    fill([-3,3,3,-3], [0,0, 3, 3], 'c')
    hold on
    fill([-3,3,3,-3], [0,0,-3,-3], 'g')

    ndata = Rx(pi*j/30/2) * Ry(pi*j/20/2) * data;
    
    icocol = [col(rem(j+000,360)+1,:);
              col(rem(j+180,360)+1,:);
              col(rem(j+120,360)+1,:);
              col(rem(j+120,360)+1,:);
              col(rem(j+180,360)+1,:);
              col(rem(j+240,360)+1,:);
              col(rem(j+180,360)+1,:);
              col(rem(j+060,360)+1,:);
              col(rem(j+060,360)+1,:);
              col(rem(j+180,360)+1,:);
              col(rem(j+300,360)+1,:);
              col(rem(j+120,360)+1,:);
              col(rem(j+180,360)+1,:);
              col(rem(j+180,360)+1,:);
              col(rem(j+120,360)+1,:);
              col(rem(j+060,360)+1,:);
              col(rem(j+120,360)+1,:);
              col(rem(j+240,360)+1,:);
              col(rem(j+240,360)+1,:);
              col(rem(j+120,360)+1,:);];
    plotshape(ndata,leng, [-3,3,-3,3], icocol)
    hold off
    pause(0.01)
end