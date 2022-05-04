% Shift the image by a particular amount (x,y)
function result = shiftImage(M, xamount, yamount)
    centerX = getCenterX(M); % get the 'center' X value
    centerY = getCenterY(M); % get the 'center' Y value
    XCords = objectXCords(M);
    result = zeros([size(M,1) size(M,2)]); % initilize the resulting matrix

%     % Iterate through the matrix
%     for i = 1:1:size(M,1)
%         for j = 1:1:size(M,2)
%             if (i == 1)
%                 result(i,j) = M(i,j) + (centerX + xamount);
%             else
%                 result(i,j) = M(i,j) + (centerY + yamount);
%             end
%         end
%     end
    % Apply shift to the object
    for k = 1:1:size(XCords,2)
        result(k,:)   = M(k, :)   + (centerX + xamount);
        result(k+1,:) = M(k+1, :) + (centerY + yamount);
    end
end
