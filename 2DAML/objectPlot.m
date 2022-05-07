% Object Group Mapping (Plot)
% The object is plotted from the last element to the first.
% Which means the color order will have to be reverrsed from the desired
% original order
function result = objectPlot(OBJ, colors)
    XCords = objectXCords(OBJ);
    Xsz = size(XCords,2);
    % if there is a larger object (in terms of number of stored vector
    % points)
    % Just plot th object
    plot(OBJ(XCords(1, Xsz), :), OBJ(XCords(1, Xsz) + 1, :), "Color", colors(1, round(mod(Xsz, size(colors,2))) + 1));
    if (Xsz > 1)
        hold on
        for k = Xsz-1:-1:1
            % Plot each of the object parts 
            plot(OBJ(XCords(1,k), :), OBJ(XCords(1,k)+1, :), "Color", colors(1, round(mod((Xsz - k), size(colors,2))) + 1));
            pause(0.01);
        end
        hold off
    end
    result = 0;
end