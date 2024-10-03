%% Problem 1
clc 
clear
close all
syms x

f1 = input('Enter the function1: ');
f2 = input('Enter the function2: ');
poi = solve(f1 == f2,x);

vol = abs(pi * int((f1.^2 - f2.^2), poi(1),poi(2)))

%% Problem 2

clc
clear
close all
syms x

f = input('Enter the function: ');
d = input('Enter the domain in which function is defined: ');
aor = input('Enter the equation of axis of rotation y = : ');
il = input('Enter the integration limits: ');

vol = pi * int((f - aor)^2,il(1),il(2));

fprintf('The volume is: %d', double(vol));

fm = matlabFunction(f);

xvals = linspace(d(1), d(2), 200);
xvalsr = fliplr(xvals);

xivals = linspace(il(1), il(2), 200);
xivalsr = fliplr(xivals);

figure
plot(xvals, fm(xvals), '-r', 'LineWidth', 2);
hold on

plot([d(1),d(2)], [aor,aor], '-b', 'LineWidth', 2);

fill([xivals,xivalsr], [fm(xivals), aor*ones(size(xivalsr))], 'cyan', 'EdgeColor','none');

xlabel('x-axis')
ylabel('y-axis')
legend('Function', 'Axis of Rotation', 'Area to be revolved');

figure 
[X, Y, Z] = cylinder(fm(xivals)-aor, 201);
Z = il(1) + Z .* (il(2) - il(1));

surf(Z, Y + aor, X,'EdgeColor','none')
hold on

plot([il(1), il(2)], [aor,aor])

xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')

%% Problem 3

clc
clear
close all
syms y
syms x

f = input('Enter the function in terms of x: ');
fy = input('Enter the function in terms of y: ');
d = input('Enter the domain in which function is defined: ');
aor = input('Enter the equation of axis of rotation x = : ');
il = input('Enter the integration limits: ');

vol = pi * int((f - aor)^2,il(1),il(2));

fprintf('The volume is: %d', double(vol));

fm = matlabFunction(f);
fmy = matlabFunction(fy);

xvals = linspace(d(1), d(2), 200);
xvalsr = fliplr(xvals);

xivals = linspace(il(1), il(2), 200);
xivalsr = fliplr(xivals);

figure
plot(xvals, fm(xvals), '-r', 'LineWidth', 2);
hold on

plot([aor,aor], [d(1),d(2)], '-b', 'LineWidth', 2);

fill([xivals,xivalsr], [fm(xivals), aor*ones(size(xivalsr))], 'cyan', 'EdgeColor','none');

xlabel('x-axis')
ylabel('y-axis')
legend('Function', 'Axis of Rotation', 'Area to be revolved');

figure 
[X, Y, Z] = cylinder(fmy(xivals)-aor, 201);
Z = il(1) + Z .* (il(2) - il(1));

surf(Y, X + aor,Z ,'EdgeColor','none')

xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')
