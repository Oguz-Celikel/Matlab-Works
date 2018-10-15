
% Created by Oguz Celikel Oct-15-2018

clc
clear all

fm=1;
fs=1000;
d=2;
t=0:1/fs:d;

m=sin(2*pi*fm.*t); %message signal

fc=100;
kf=80;

 summ=0;
  for i=1:1:length(t);
      summ = summ + m(i)*(1/fs);
      m1(i) = summ;
  end

y=cos((2*pi*fc.*t) + (2*pi*kf.*m1));   %Modulated signal

figure
subplot(211)
plot(t,m)
title('Message Signal');
xlabel('Time');
ylabel('Amplitude');
subplot(212)
plot(t,y);
title('FM Modulated Signal');
xlabel('Time');
ylabel('Amplitude');

N=length(m);
% N=512;
fline=linspace(-fs/2,fs/2,N);
figure
subplot(211)
plot(fline,abs(fftshift(fft(m,N)))/N);
% axis([-200 200 0 1]);
title('Message Signal');
xlabel('Frequency');
ylabel('Amplitude');
subplot(212)
plot(fline,abs(fftshift(fft(y,N)))/N);
% axis([-200 200 0 1]);
title('FM Modulated Signal');
xlabel('Frequency');
ylabel('Amplitude');

% w=diff(y);

h = 0.001;       % step size   
w = diff(y)/h;   % first derivative

figure
plot(w);
title('The Differentation Output w(t)');

C=1*10^-6;
R1=(3.2)*10^5;
R2=(3.2)*10^4;
R3=(3.2)*10^3;
R4=(3.2)*10^2;

to1=R1*C;
to2=R2*C;
to3=R3*C;
to4=R4*C;

for i=1:length(t)-1
    t1(i)=t(i+1);
end

exp1=exp(-t1/to1);
exp2=exp(-t1/to2);
exp3=exp(-t1/to3);
exp4=exp(-t1/to4);

yout1=w(1)+w.*exp1;
yout2=w(1)+w.*exp2;
yout3=w(1)+w.*exp3;
yout4=w(1)+w.*exp4;


figure
subplot(411)
plot(yout1);
title('R=3.2*10^5');
subplot(412)
plot(yout2);
title('R=3.2*10^4');
subplot(413)
plot(yout3);
title('R=3.2*10^3');
subplot(414)
plot(yout4);
title('R=3.2*10^2');

