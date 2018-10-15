
% Created by Oguz Celikel Oct-15-2018

clc
clear all


%--------------------------------------------
% 8.1


a=0;
b=10;

N=[10 50 100];
M=[10 50 100];




for o=1:3
    
    for k=1:M(o)
    
    x= a + (b-a).*rand(N(o),1);

    summ=0;
    
         for i=1:N(o)
        
            summ=x(i)+summ;
         end
    
    un(k)=summ/N(o);

    end


summ2=0;

for z=1:N(o)
    
    summ2=un(z)+summ2;
end

u(o)=summ2/M(o);

end



ex=5.*ones(1,100);

figure

stem(un)
hold on
plot(ex)
hold on

for d=1:3
plot(u(d).*ones(1,100),'--');
end

ex=5.*ones(1,50);

er1=abs(((ex(1)-u(1))/5)*100);
er2=abs(((ex(1)-u(2))/5)*100);
er3=abs(((ex(1)-u(3))/5)*100);



