% Object Rotation
% Note this object rotation works only with an object centered around the
% origin. Otherwise it will give weird results
function result = objectRotate(OBJ, theta)
    result = [];
    XD = objectXCords(OBJ);
    %YD = objectYCords(OBJ);

    % Iteratively rotate each of the objects
    for k = 1:1:size(XD,2)
        nobj = OBJ(XD(1,k):XD(1,k)+1, :); % make new object
        nobj = [cos(theta) -sin(theta); sin(theta) cos(theta)] * nobj; % Transform the matrix
        result = [result nobj];
    end
end