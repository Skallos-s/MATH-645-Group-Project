% This is a generalized shift function with a physics aspect to the
% transformation to make the movement feel "more alive"
function result = shiftWithPhysics(M, velocityX, velocityY, accelerationX, accelerationY, t)
    result = shiftImage(M, velocityX * t + 0.5 * accelerationX * (t * t), velocityY * t + 0.5 * accelerationY * (t * t));
end