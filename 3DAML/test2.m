[data1,leng1] = SnubDisphenoid(1);
[data2,leng2] = Icosahedron(1);

col = hsv(256);
axes = [-3,3,-3,3];

for k=0:2560
    tran = [cos(2*pi*k/75);sin(2*pi*k/75);0];
    ndata1 = Rx(pi*k/256) * Ry(2*pi*k/128) * data1 + tran;
    ndata2 = Rx(pi*k/256) * Ry(2*pi*k/128) * data2 - tran;

    plotshape(ndata1,leng1, axes, col(rem(k,256)+1,:))
    plotshape(ndata2,leng2, axes, col(rem(2*k,256)+1,:))
    hold off
    pause(0.001)
end
