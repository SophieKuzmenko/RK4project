function test()
% Testing the correctness of implementation of RK4 method
% (P2Z45_SKU_rungekutty4order.m function) by
% examining the order of a total accumulated error

% function 1
name1 = "Function: x^2";
y_1val = 100;
a_k_1 = {@(x) 0, @(x) 1, @(x) -x};
bx_1 = @(x) 0;
y0_1 = [ 1 1 2];
a_1 = 1;
b_1 = 10;
%
n_1 = 100:-1:5;
[h_1, res_1] = helper_test(a_1, b_1, n_1, bx_1, a_k_1, y_1val, y0_1);

% function 2
name2 = "Function: sin(x) + 3cos(x)";
y_2val = -1;
a_k_2 = {@(x)1, @(x) 0, @(x) 1};
bx_2 = @(x) 0;
y0_2 = [1 1 -3];
a_2 = pi/2;
b_2 = 11*pi/2;
% 
n_2 = 500:-1:10;
[h_2, res_2] = helper_test(a_2, b_2, n_2, bx_2, a_k_2, y_2val, y0_2);

% function 3
name3 = "Function: xsin(x) - x^2";
y_3val = - 4*(pi^2);
a_k_3 = { @(x) -2, @(x) x, @(x) 0, @(x) 0, @(x) 1};
bx_3 = @(x) (x^2)*cos(x) - 4*cos(x);
y0_3 = [pi/2, pi/2 - (pi^2)/4, 1- pi, -pi/2 - 2, -3];
a_3 = pi/2;
b_3 = 2*pi;
%
n_3 = 303:-1:3;
[h_3, res_3] = helper_test(a_3, b_3, n_3, bx_3, a_k_3, y_3val, y0_3);
% rysowanie wykresów
plotter_test( h_1, res_1, name1, h_2, res_2, name2, h_3, res_3, name3);

end % function