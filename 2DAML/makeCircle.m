% Make a circle Object
% Detail Value is a 1/x value
% This is unit divisor side
function result = makeCircle(radius, detailValue)
    result = [radius * cos(0:detailValue:2*pi+pi/32); radius * sin(0:detailValue:2*pi+pi/32)];
end