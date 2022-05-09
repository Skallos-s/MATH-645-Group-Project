% Make a rectangle
function result = makeRectangle(width, height)
    result = [width 0; 0 height] * makeSquare(1);
end