% Resize the background Image to make it fit in a plotted area
function result = backgroundResize(IMG, value)
    result = imresize(IMG, value);
end