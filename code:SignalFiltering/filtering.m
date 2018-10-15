
% Created by Oguz Celikel Oct-15-2018

f1=200;
f2=550;
Fs=3e3;
d=0.02;
t=0:(1/Fs):d;

input_signal=sin(2*pi*f1.*t)+cos(2*pi*f2.*t);

Fc=400;
n=5;

[b,a] = butter(n,Fc/(Fs/2),'low');
N=256;

filtered_sig=filter(b,a,input_signal);
output=fft(filtered_sig,N);
input=fft(input_signal,N);

f=linspace(-Fs/2,Fs/2,N);
figure;
subplot(211);
plot(f,abs(fftshift(input)));
title('Magnitude Response of Input')
subplot(212);
plot(f,abs(fftshift(output)));
title('Magnitude Response of Output')