% Make a circle Object
% Detail Value is a 1/x value
% This is unit divisor side
function result = makeEllipse(a, b, detailValue)
    result = [a * cos(0:detailValue:2*pi+pi/6); b * sin(0:detailValue:2*pi+pi/6)];
end