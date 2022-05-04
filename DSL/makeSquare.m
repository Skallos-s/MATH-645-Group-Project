% Make a set of vector points that make the shape of a square
function result = makeSquare(size)
    % make the unit square * size scale factor and it gives you the set of
    % vectors resulted below
    result = [[0 0]' [0 size]' [size size]' [size 0]'];
end