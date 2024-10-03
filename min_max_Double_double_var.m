clc
close all
syms x y
f(x,y)=6*x^2+x^3+3*x*y^2+6*x*y;
p=diff(f,x);
q=diff(f,y);
[ax, ay]=solve(p,q);
ax=double(ax);
ay=double(ay);

r=diff(p,x);
s=diff(q,y);
t=diff(p,y);
D=r*s-t^2;
fsurf(f);
legstr={'Function plot'};
for i=1:size(ax)
    T1=D(ax(i),ay(i));
    T1=double(T1);
    T2=r(ax(i),ay(i));
    T2=double(T2);
    T3=f(ax(i),ay(i));
    T3=double(T3);
    if T1==0
        sprintf("At (%f,%f) further investigation is required",ax(i),ay(i))
        legstr=[legstr,{"Case of further investigation"}];
        mrk="ko";
    elseif (T1<0)
        sprintf("The point (%f,%f) is a saddle point",ax(i),ay(i))
        legstr=[legstr,{"saddle point"}];
        mrk="bv"
    else
        if T2<0
            sprintf("The point (%f,%f) is a maxima point",ax(i),ay(i))
            legstr=[legstr,{"maxima"}];
            mrk="g+"
        else
            sprintf("The point (%f,%f) is a minima point",ax(i),ay(i))
            legstr=[legstr,{"maxima"}];
            mrk="r*"
        end
    end
    hold on
    plot3(ax(i),ay(i),T3,mrk,'LineWidth',4)
end
legend(legstr,'Location','Best')