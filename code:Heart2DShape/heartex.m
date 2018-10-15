
% Created by Oguz Celikel Oct-15-2018

t=linspace(-pi,pi,350);
X = t.*sin(pi*sin(t)./t);
Y = -abs(t).*cos(pi*sin(t)./t);
plot(X,Y);
fill(X,Y,'r');
set(gcf,'Position',get(0,'Screensize'));
title('I love you!','FontSize',28) ;