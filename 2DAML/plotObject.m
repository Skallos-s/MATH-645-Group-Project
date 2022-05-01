% Plot Object
% Colors can be either 1 color or a list of colors
function result = plotObject(OBJ, colors)
    XD = objectXCords(OBJ); % Get the list of X Cordinate Rows
    for k = 1:1:size(XD,2)
        % Color Mapping Plot
        if (size(colors,2) > 1)
            fill(OBJ(XD(1,k), :), OBJ(XD(1,k)+1, :), colors(1, round(mod(k, size(colors,2)))));
        else
            fill(OBJ(XD(1,k), :), OBJ(XD(1,k)+1, :), colors(1, 1));
        end
    end
end