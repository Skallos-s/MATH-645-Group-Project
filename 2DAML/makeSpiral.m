% Make an (Equangular) spiral object
function result = makeSpiral(spiralDecreaseRate, deltaT, endTheta)
    t = 0:deltaT:endTheta;
    result = zeros([2 size(t, 2)]);
    result(1,:) = (spiralDecreaseRate .* t) .* cos(2 .* t);
    result(2,:) = (spiralDecreaseRate .* t) .* sin(2 .* t);
end

