% Sample data
syms x 
f=x.^2+6*x+4;
x1=-5;
fx=diff(f,x);
x_values = -10:0.1:10;
y_values=subs(f,x,x_values);
% Plotting the data
figure;
plot(x_values, y_values, 'b', 'LineWidth', 1.5);
hold on;

% Custom axes lines
plot([-10 10], [0 0], 'k-', 'LineWidth', 2); % X-axis
plot([0 0], [-10 10], 'k-', 'LineWidth', 2); % Y-axis

hold on
D=[x1-5,x1+5];
m=subs(fx,x,x1);
c=subs(f,x,x1);

tan_line=m*(x-x1)+c;

h=fplot(tan_line,D,"r--",'LineWidth',2,'MarkerSize',10);
title("x^2+6*x+4")
% Axis properties
ax = gca;
ax.LineWidth = 1.5;
ax.XColor = 'r';
ax.YColor = 'g';

% Additional options
grid on;
axis([-10 10 -10 10]);
axis equal;