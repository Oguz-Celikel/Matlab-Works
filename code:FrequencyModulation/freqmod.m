
% Created by Oguz Celikel Oct-15-2018

clc
clear all

%-------------------------------------
%5. Frequency Modulation
%-------------------------------------

%-------------------------------------
%5.1 Integration
%-------------------------------------


n=1/10000;
t=2:n:4;
f=t.*t;
sum=0;

for i=1:length(t);
    sum=sum+(f(i)*n);
    w(i)=sum;
end
plot(t,f,t,w,'Linewidth',2)
hold on  

figure;
subplot(311);
plot(t,f);
hold on;
subplot(312);
plot(t,w);
grid on;

%-------------------------------------
%5.2 Frequency Modulation
%-------------------------------------


%-------------------------------------
%5.2.a
%-------------------------------------

fm=50;
fs=2500;
duration=0.1;
d=0:(1/fs):duration;
fc=200;
kf=100;
m=cos(2*pi*fm*d);

%-------------------------------------
%5.2.b
%-------------------------------------

sum1=0;
for i=1:length(d);
    sum1=sum1+(m(i)*(1/fs));
    m1(i)=sum1;
end

xfm=cos(2*pi*fc*d+2*pi*kf*m1);

%-------------------------------------
%5.2.c
%-------------------------------------

subplot(2,1,1)
plot(d,m)
subplot(2,1,2)
plot(d,xfm)

%-------------------------------------
%5.2.d
%-------------------------------------

N=1024;
Fm=fft(m,N)*(1/fs);
FM=fftshift(Fm);

Fxfm=fft(xfm,N)*(1/fs);
FXFM=fftshift(Fxfm);
fline=linspace(-fs/2,fs/2,N);

figure;
subplot(2,1,1)
plot(fline,abs(FM))
subplot(2,1,2)
plot(fline,abs(FXFM))

