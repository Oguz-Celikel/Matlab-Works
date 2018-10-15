
% Created by Oguz Celikel Oct-15-2018

clc
clear all

%-------------------------------------
%2.1 Conventional Amplitude Modulaton
%-------------------------------------

%-------------------------------------
%2.1.a
%-------------------------------------

Am= 0.7;
fm= 250;
fc= 2000;
Fs= 10000;
d=5;

t = 0:1/Fs:5*(1/fm);
m = Am*sin(2*pi*fm*t);

%-------------------------------------
%2.1.b
%-------------------------------------

u1=0.7;u2=1;u3=1.5;

Ac1 = Am/u1;
Ac2 = Am/u2;
Ac3 = Am/u3;

c = Ac2*cos(2*pi*fc*t);

%-------------------------------------
%2.1.c
%-------------------------------------

s1 = Ac1*(1+u1*sin(2*pi*fm*t)).*cos(2*pi*fc*t);
s2 = Ac2*(1+u2*sin(2*pi*fm*t)).*cos(2*pi*fc*t);
s3 = Ac3*(1+u3*sin(2*pi*fm*t)).*cos(2*pi*fc*t);

%-------------------------------------
%2.1.d
%-------------------------------------

figure;
subplot(311);
plot(t,s1);
title('u=0.7');
hold on;
subplot(312);
plot(t,s2);
title('u=1');
hold on;
subplot(313);
plot(t,s3);
title('u=1.5');
grid on;

N=512;
f=linspace(-Fs/2,Fs/2,N);
mx=fft(m,N);
cx=fft(c,N);
sx=fft(s2,N);

figure;
subplot(311);
plot(f,abs(fftshift(mx)));
xlabel('magnitude responce of m(t)');
hold on;
subplot(312);
plot(f,abs(fftshift(cx)));
xlabel('magnitude responce of c(t)');
hold on;
subplot(313);
plot(f,abs(fftshift(sx)));
xlabel('magnitude responce of s(t)');
hold on;

%-------------------------------------
%2.2 Demodulation of conventional AM Signal
%    'Square-Law Envelope Detector'
%-------------------------------------

%-------------------------------------
%2.2.a
%-------------------------------------

ss= 2*(s2.*s2);

%-------------------------------------
%2.2.b
%-------------------------------------

Nn=3;
[b,a] = butter(Nn, fc/(Fs/2), 'low');

%-------------------------------------
%2.2.c
%-------------------------------------

filterx= filter(b,a,ss);

%-------------------------------------
%2.2.d
%-------------------------------------

sqrtss= sqrt(filterx);

%-------------------------------------
%2.2.e
%-------------------------------------

demodss= sqrtss-Ac2;
demodxx = fft(demodss,N);

%-------------------------------------
%2.2.f
%-------------------------------------

figure;
plot(t,m);
legend('original message');
hold on;
plot(t,demodss);
legend('demodulated signal');
grid on;

%-------------------------------------
%2.2.g
%-------------------------------------

figure;
subplot(211);
plot(f,abs(fftshift(mx)));
legend('magnitude responce of original message');
hold on;
subplot(212);
plot(f,abs(fftshift(demodxx)));
legend('magnitude responce of demodulated message');
grid on;
























