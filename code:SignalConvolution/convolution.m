
% Created by Oguz Celikel Oct-15-2018
%convolution

x=[0 1 2 -1 2 3 0 0 1];
h=[1 0 -1];
y=conv(x,h);
figure;
subplot(2,2,1)
stem(x);
title('x[n]')
grid on
axis([0 10 -1.2 3.2]);
subplot(2,2,3);
stem(h);
title('h[n]');
grid on;
axis([0 4 -1.2 1.2]);
subplot(2,2,[2 4]);
stem(y);
title('y[n]=x[n]*h[n]');
grid on
