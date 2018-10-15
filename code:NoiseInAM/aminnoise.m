
% Created by Oguz Celikel Oct-15-2018

clc
clear all

%--------------------------------------------
% 9.1

Fc=20000;

image1=imread('circuit.tif');
M=im2double(image1);

%--------------------------------------------
% 9.2

whos M;
L=numel(M);
Fs=L;

%--------------------------------------------
% 9.3

d=1;
t=0:(1/Fs):d-(1/Fs);

c=cos(2*pi*Fc*t);
mes=reshape(M,1,L);

%--------------------------------------------
% 9.4
dsb=mes.*c;

%--------------------------------------------
% 9.5

uneg1 = awgn(dsb, 5, 'measured');

%--------------------------------------------
% 9.6

dsbc1=uneg1.*cos(2*pi*Fc*t);
[b, a] = butter(25,Fc/(Fs/2), 'low');
uo1 = 2*filter(b,a,dsbc1);
x1 = reshape(uo1, 280, 272);

%--------------------------------------------
% 9.7

figure
subplot(2,1,1);
imshow(M);
title('Original Image');
hold on;
subplot(2,1,2);
imshow(x1);
title('Noise = 5 dB');

%--------------------------------------------
% 9.8

figure
for i=0:1:8
    
uneg = awgn(dsb, -12+(3*i), 'measured');
dsbc=uneg.*cos(2*pi*Fc*t);
[b, a] = butter(25,Fc/(Fs/2), 'low');
uo = 2*filter(b,a,dsbc);
x = reshape(uo, 280, 272);

subplot(2,5,1);
imshow(M);
title('Original Image');
hold on;
subplot(2,5,i+2);
imshow(x);
title(['Noise=',num2str(-12+(3*i))]);

end

