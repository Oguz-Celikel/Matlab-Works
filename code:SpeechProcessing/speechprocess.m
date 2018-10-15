
% Created by Oguz Celikel Oct-15-2018

clc
clear all

%--------------------------------------------
% 4.1

fc=3000;
fs=8000;
d=4.9902;
t=0:1/fs:d;

%--------------------------------------------
% 4.1.a

m=audioread('speech_dft_8kHz.wav');
c=cos(2*pi*fc.*t);

%--------------------------------------------
% 4.1.b

Nn1 = 10;
[b1,a1] = butter(Nn1, fc/(fs/2), 'high');
h1 = freqz(b1,a1);
figure;
plot(abs(h1));
title('Filter-High');
xlabel('Freq.');
ylabel('Amp.');

%--------------------------------------------
% 4.1.c

mt=transpose(m);
dsb=mt.*c;

fil_dsb=filter(b1,a1,dsb);

%--------------------------------------------
% 4.1.d
hilb_m=hilbert(m);
hil_m=transpose(hilb_m);
hilx=imag(hil_m);

ssb=mt.*cos(2*pi*fc.*t)-hilx.*sin(2*pi*fc.*t);

%--------------------------------------------
% 4.1.e

N=length(ssb);
xy1 = fft(fil_dsb,N);
xy2 = fft(ssb,N);

f = linspace(-fs/2,fs/2,N);

figure;
subplot(211);
plot(f,abs(fftshift(xy1))/N);
title('dsb-usb');
xlabel('Freq.');
ylabel('Amp.');
subplot(212);
plot(f,abs(fftshift(xy2))/N);
title('ssb-usb');
xlabel('Freq.');
ylabel('Amp.');

%--------------------------------------------
% 4.2.a

Nn2 = 20;
[b2,a2] = butter(Nn2, 900/(fs/2), 'low');
h2 = freqz(b2,a2,fs/2);

figure;
plot(abs(h2));
title('Filter-Low');
xlabel('Freq.');
ylabel('Amp.');


%--------------------------------------------
% 4.2.b

c2=cos(2*pi*fc.*t);
demod1=ssb.*c2;
demod2=filter(b2,a2,demod1);

%--------------------------------------------
% 4.2.c

N=length(mt);
xde = fft(demod2,N);
xde2 = fft(m,N);

figure;
subplot(211);
plot(f,abs(fftshift(xde2))/N);
title('m');
xlabel('Freq.');
ylabel('Amp.');
subplot(212);
plot(f,abs(fftshift(xde))/N);
title('de');
xlabel('Freq.');
ylabel('Amp.');

%--------------------------------------------
% 4.2.d

figure;
subplot(211);
plot(t,m);
title('m');
xlabel('Time');
ylabel('Amp.');
subplot(212);
plot(t,demod2);
title('de');
xlabel('Time');
ylabel('Amp.');


