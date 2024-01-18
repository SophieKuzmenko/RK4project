function yres = P2Z45_SKU_rungekutty4order(a, b, n, bx, a_k, y0)
% Project 2, task 45
% Sofiia Kuzmenko
%
% Solving linear m-th order differential equation
% given below:
% a_m(x)*y^{m} + a_{m-1}(x)*y^{m-1} + ... + a_1(x)*y' + a_0(x)*y = bx(x)
% over the interval [a,b] using classic Runge–Kutta method (also known as RK4)
% INPUT:
%   a,b  - ends of the interval
%   n    - number of steps to be performed
%   bx   - a handle to the function bx(x)
%   a_k  - single-dimesional cell array of handles to the functions
%          a_0(x), a_1(x),..., a_m(x), where
%          a_m does not have any zeros on the interval [a,b]
%   y0   - vector of intial conditions x0,y_1,y_2,...,y_m
%          where x0 = a, y_1 = y(x0) and y_i = y^{i-1}(x0) for i = 2...m 
% OUTPUT:
%   yres - horizontal vector of approximations of the values of function 
%          y(x) at points a + kh for 0<=k<=n, where h is the length of a
%          single step, and yres(1) = y(x0) is taken from 
%          the vector of initial conditions y0

% checking whether y0 is vertical
% transposing it if needed
s = size(y0);
if (s(1)<s(2))
    y0 = y0'; 
end
% creating an additional function handle F(Y), 
% that accepts only one argument, for cleaner code
F = @(y) countfunction(y, a_k, bx); 
h = (b - a)/n;
% preallocationg space
Y = zeros(length(y0), n+1);
% assinging y0 as a starting point
Y(:,1) = y0;

for k = 1:n
    % executing a single step of the RK4    
    K0 = h*F(Y(:,k));
    K1 = h*F(Y(:,k) + (1/2)*K0);
    K2 = h*F(Y(:,k) + (1/2)*K1);
    K3 = h*F(Y(:,k) + K2);
    Y(:,k+1) = Y(:,k) + (1/6)*K0 + (1/3)*K1 + (1/3)*K2 + (1/6)*K3;
end
yres = Y(2,:);

end % function
