function F = countfunction(Y_k, a_k, bx)
% Calculating the value of a vector F(Y) = Y', 
% where Y = [ x, y(x), y'(x), ...., y^({m-1}(x)]'
% therefore F(Y) = [ 1, y'(x), y^{2}(x), ..., y^{m}(x)],
% where formula for calculating y^{m}(x) is derived from the quation below:
% a_m(x)*y^{m} + a_{m-1}(x)*y^{m-1} + ... + a_1(x)*y' + a_0(x)*y = bx(x)
% after rearranging:
% y^{m}(x) = [ bx(x) - (a_0(x)*y(x) + ...+ a_{m-1}(x)*y^{m-1}(x) ] / a_m(x)
% INPUT:
%   Y_k - vector Y at a point x_k 
%   a_k - single-dimesional cell array of handles to the functions
%         a_0(x), a_1(x),..., a_m(x), where
%         a_m does not have any zeros on the interval [a,b]
% bx    - a handle to the function bx(x)
% OUTPUT:
%   F   - calculated vector F(Y_k)

n = length(Y_k);
x = Y_k(1); % additional variable for storing x_k, provides cleaner code
F = zeros(n, 1);
F(1) = 1;
% copying the values of derivatives at a point x_k to the output vector
if (n>2) % if y0 containsmore than just x_k and y(x_k)
    F(2:(n-1)) = Y_k(3:n);
end
% calculating the value of the m-th derivative at a point x_k 
% using the formula 
% y^{m}(x) = [ bx(x) - (a_0(x)*y(x) + ...+ a_{m-1}(x)*y^{m-1}(x) ] / a_m(x)
val = bx(x);
for i = 1:n-1
    val = val - (a_k{i}(x)*Y_k(i+1));
end
F(n) = val/a_k{n}(x);

end % function