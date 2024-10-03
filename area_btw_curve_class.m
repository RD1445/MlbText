

clc
close all 
syms x 
% y1=x.^2 ;
% y2= 2*x;

% y1=x^4-4*x^2+4;
% y2=x^2;
y1=x^2;
y2=2*x;

t=solve(y1-y2);
po=double(t);
poi=sort(po);
n=length(poi);
m1=min(poi);
m2=max(poi);
D=[m1-1,m2+1];

plot1=fplot(y1,D);

hold on
TA=0;
plot2=fplot(y2,D);

if n>2
    for i=1:n-1
        A=int(y1-y2,poi(i),poi(i+1));
        TA=TA+abs(A);
        x1=linspace(poi(i),poi(i+1));
        yy1=subs(y1,x,x1);
        yy2=subs(y2,x,x1);
        xx=[x1,fliplr(x1)];
        yy=[yy1,fliplr(yy2)];
        fill(xx,yy,'');
    end 
else
        A=int(y1-y2,poi(1),poi(2))
        TA=abs(A)
        x1=linspace(poi(1),poi(2))
        yy1=subs(y1,x,x1)
        yy2=subs(y2,x,x1)
        xx=[x1,fliplr(x1)]
        yy=[yy1,fliplr(yy2)]
        fill(xx,yy,'y')
end 
grid on 
