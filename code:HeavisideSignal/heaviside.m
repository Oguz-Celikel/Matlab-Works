
% Created by Oguz Celikel Oct-15-2018

t=-4:0.01:4;
x=3*heaviside(t+3)-2*heaviside(t+2)+2*heaviside(t-2)-3*heaviside(t-3);
plot(t,x);
hold on;
grid on;
summ=0;
for t=-4:0.01:4
    area=(3*heaviside(t+3)-2*heaviside(t+2)+2*heaviside(t-2)-3*heaviside(t-3))/100;
    summ=summ+area;
end
b0=0.125*summ;
N=10;
    a=zeros(1,N);
    b=zeros(1,N);
    for k=1:N
        summ=0;
        for t=-4:0.01:4
            area=((3*heaviside(t+3)-2*heaviside(t+2)+2*heaviside(t-2)-3*heaviside(t-3))*sin(k*pi*t*0.25))/100;
            summ=summ+area;
        end
        a(k)=0.25*summ;
        summ=0;
        for t=-4:0.01:4
            area=((3*heaviside(t+3)-2*heaviside(t+2)+2*heaviside(t-2)-3*heaviside(t-3))*cos(k*pi*t*0.25))/100;
            summ=summ+area;
        end
        b(k)=0.25*summ;
    end
    y=b0;
    t=-4:0.01:4;
    for k=1:N
        y=y+a(k)*sin(k*pi*t*0.25)+b(k)*cos(k*pi*t*0.25);
    end
    title('N=3');
    plot(t,y);
