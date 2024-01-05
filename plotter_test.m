function ...
    plotter_test(h_1, res_1, name1, h_2, res_2, name2, h_3, res_3, name3)
% Checking the order of the total accumulated error for RK4 (implemeted in 
% P2Z45_SKU_rungekutty4order function) by comparing its graph
% with the graph of h^4 where h is the step size
% INPUT:
%   h_1, h_2, h_3          - vectors of step size values
%   res_1, res_2, res_3    - vectors of total accumulated error values, 
%                            where 
%                            res_i(j) corresponds to the step size h_i(j) 
%                            and function y_i(x)
%                            for j = 1...length(h_i) and i = 1,2,3
%   name_1, name_2, name_3 - strings that contain formulas of functions,
%                            and will be used as plot titles,
%                            name_i corresponds to y_i(x) for i = 1,2,3
%                            
% OUTPUT: NONE

figure(1)
subplot(2,2,1)
hold on;
plot(h_1, h_1.^4, "g", "LineWidth",2);
plot(h_1, res_1, "r", "LineStyle","--", "LineWidth",2);
title(name1);
legend('h^4', 'total acc err');
subplot(2,2,2)
hold on;
plot(h_2, h_2.^4, "g", "LineWidth",2);
plot(h_2, res_2, "r", "LineStyle","--", "LineWidth",2);
title(name2);
legend('h^4', 'total acc err');
subplot(2,2,3)
hold on;
plot(h_3, h_3.^4, "g", "LineWidth",2);
plot(h_3, res_3, "r", "LineStyle","--", "LineWidth",2);
title(name3);
legend('h^4', 'total acc err');

end % function