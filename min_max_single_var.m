clc
close all
syms x
f=x.^3+6*x^2;

fx=diff(f,x);
fxx=diff(fx,x)';
roots_f=solve(f,x);
minx=min(double(roots_f));
maxx=max(double(roots_f));
fplot(f,[minx-2,maxx+2],'r','LineWidth',2);
hold on

roots=solve(fx,x);


for i=1:length(roots)
    fxx_sub=subs(fxx,x,roots(i));
    y_value=subs(f,x,roots(i));
    plot(roots(i),y_value,"g*", 'MarkerSize', 10)
    if fxx_sub>0
        fprintf('The critical point ')
        fprintf(char(roots(i)))
        fprintf(' is an local minima\n')
    elseif fxx_sub<0        
        fprintf('The critical point ')
        fprintf(char(roots(i)))
        fprintf(' is an local maxima\n')
    else 
        fprintf('The critical point ')
        fprintf(char(roots(i)))
        fprintf(' is neither a manima nor a minima\n')
    end
end
title('x^3+6*x^2');
xlabel('X-axis');
ylabel('Y-axis');
grid on;


hold off;