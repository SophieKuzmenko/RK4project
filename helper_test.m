function [h, res] = helper_test(a, b, n, bx, a_k, yval, y0)
% Calculating total accumulated error, that appears during the process of
% solving a linear m-th order differential equation given below
% a_m(x)*y^{m} + a_{m-1}(x)*y^{m-1} + ... + a_1(x)*y' + a_0(x)*y = bx(x)
% over the interval [a,b] using classic Runge–Kutta method (RK4), for
% different sizes of step h
% INPUT:
%   a,b  - ends of the interval
%   n    - vector of numbers of steps to be performed, in descending order
%   bx   - a handle to the function bx(x)
%   a_k  - single-dimesional cell array of handles to the functions
%          a_0(x), a_1(x),..., a_m(x), where
%          a_m does not have any zeros on the interval [a,b]
%   y0   - vector of intial conditions x0,y_1,y_2,...,y_m
%          where x0 = a, y_1 = y(x0) and y_i = y^{i-1}(x0) for i = 2...m 
%   yval - exact function value at a point b
% OUTPUT:  
%   h    - vector of step sizes, in ascending order
%   res  - vector of total accumulated error values, where
%          res(i) corresponds to the step size h(i) for i = 1...length(h)

ln = length(n);
% preallocating space
res = zeros(1,ln);
% creating vector h
h = (b-a)./n;
for i = 1:ln
    % approximating y over the interval [a,b] with RK4 method
    ysol = P2Z45_SKU_rungekutty4order(a, b, n(i), bx, a_k, y0);
    % calculating total accumulated error
    res(i) = abs(ysol(length(ysol)) - yval);
end

end %function