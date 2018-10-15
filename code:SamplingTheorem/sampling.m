
% Created by Oguz Celikel Oct-15-2018

clear all;
clc;

f1=500;
f2=3000;
Fs=24000;
d =0.006;
t = 0:1/Fs:d;
t1=2*t;
t2=6*t;

x=cos(2*pi*f1.*t)+cos(2*pi*f2.*t);
x1=cos(2*pi*f1.*t1)+cos(2*pi*f2.*t1);
x2=cos(2*pi*f1.*t2)+cos(2*pi*f2.*t2);

figure;
subplot(311);
plot(t,x);
ylabel('original');
subplot(312);
plot(t,x1);
ylabel('Downsample by 2');
subplot(313);
plot(t,x2);
ylabel('Downsample by 6');

N=1024;
xa = fft(x,N);
xb = fft(x1,N);
xc = fft(x2,N);

f=linspace(-Fs/2,Fs/2,N);
f1=linspace(-Fs/4,Fs/4,N);
f2=linspace(-Fs/12,Fs/12,N);
figure;
title('Frequency Domain');
subplot(311);
plot(f,abs(fftshift(xa)));
hold on;
ylabel('original');
subplot(312);
plot(f1,abs(fftshift(xb)));
hold on;
ylabel('Downsample by 2');
subplot(313);
plot(f2,abs(fftshift(xc)));
grid on;
ylabel('Downsample by 6');

y1 = interp1(t1, x1, t, 'cubic');
y2 = interp1(t2, x2, t, 'cubic');
figure;
title('cubic');
subplot(211);
ylabel('Downsample by 2');
plot(t, x1);
hold on
plot(t, y1);
grid on
subplot(212);
ylabel('Downsample by 6');
plot(t, x2);
hold on
plot(t, y2);
grid on

y1 = interp1(t1, x1, t, 'linear');
y2 = interp1(t2, x2, t, 'linear');
figure;
title('linear');
subplot(211);
plot(t, x1);
ylabel('Downsample by 2');
hold on
plot(t, y1);
grid on
subplot(212);
plot(t, x2);
hold on
plot(t, y2);
grid on
ylabel('Downsample by 6');
