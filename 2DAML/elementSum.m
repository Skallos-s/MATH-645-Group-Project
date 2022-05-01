% Element Wise Sumation of a particular vector
% NOTE: This is an element wise sum of a row vector
function result = elementSum(A)
    result = 0;
    % Iterate through the columns of A
    for k = 1:1:size(A,2)
        result = result + A(1,k);
    end
end