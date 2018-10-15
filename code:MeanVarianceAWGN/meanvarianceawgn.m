
% Created by Oguz Celikel Oct-15-2018

clc
clear all

fc=75;
d=0.1;
fs=1000;
t=0:1/fs:d;
x=cos(2*pi*fc.*t);
snr=3;

N=1000;

summx=0;
summy=0;
for i=1:1:N
    
y=awgn(x,snr);
n=y-x;

    summ=0;
    for i=1:1:length(n)
         summ=summ+n(i);
    end
summx=summ/length(n)+summx;

    summ2=0;
    for i=1:1:length(n)
        summ2=summ2+ ((n(i)-summ).^2);
    end
summy=summ2/length(n)+summy;
   
end

m=summx/N;   %mean value
varu=summy/N;  %variance

figure
plot(t,x)
hold on
plot(t,y);
title('Messsge and Modulated Signal');
xlabel('Time');
ylabel('Amplitude');
legend('Original signal','Signal with AWGN');