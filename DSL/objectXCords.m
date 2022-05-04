% The the Object's X Cordinate Rows of each of the different parts
% of the object
function result = objectXCords(OBJ)
    result = [];
    XD = mod(1:1:size(OBJ,1), 2);
    for k = 1:1:size(XD,2)
        if (XD(1,k) == 1)
            result = [result k];
        else
            continue;
        end
    end
end