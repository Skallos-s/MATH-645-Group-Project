function plotshape(facedata, facelength, axes, color)

r = 1;
[x,~] = size(color);

for j=1:length(facelength)
    poly = facedata(:, r : r+facelength(j)-1);
    r = r + facelength(j);
    if [0,0,1]*normal(poly) > 0
        fill(poly(1,:),poly(2,:),color(rem(j,x)+1,:))
        axis(axes)
        hold on
    end
end