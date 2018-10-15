
% Created by Oguz Celikel Oct-15-2018

clc
clear all

%--------------------------------------------
% 7.1

fs=1000;
fc=100;
d = 0.3;

t=0:1/fs:d;

m=ones(1,301);

for i=1:1
    for j=1:51
            m(i,j)=0;
    end 
end

for i=1:1
    for j=51:101
            m(i,j)=1;
    end 
end

for i=1:1
    for j=101:151
            m(i,j)=2;
    end 
end       

for i=1:1
    for j=151:201
            m(i,j)=-1;
    end 
end

for i=1:1
    for j=201:301
            m(i,j)=1;
    end 
end     

%--------------------------------------------
% 7.1.a

figure
plot(t,m)
title('message');
xlabel('time');
ylabel('amplitude');

%--------------------------------------------
% 7.1.b

N=1024;
F=fft(m,N);
fline=linspace(-fs/2,fs/2,N);

figure;
plot(fline,abs(fftshift(F))/length(m));
title('Message');
xlabel('Frequency');
ylabel('amplitude');

%--------------------------------------------
% 7.1.c

kp1=pi/4;
kp2=pi/2;
kp3=pi;



figure
u1=cos(2*pi*fc.*t + kp1.*m);
subplot(311)
plot(t,u1)
title('modulated with kp=pi/4');
xlabel('time');
ylabel('amplitude');

u2=cos(2*pi*fc.*t + kp2.*m);
subplot(312)
plot(t,u2)
title('modulated with kp=pi/2');
xlabel('time');
ylabel('amplitude');

u3=cos(2*pi*fc.*t + kp3.*m);
subplot(313)
plot(t,u3)
title('modulated with kp=pi');
xlabel('time');
ylabel('amplitude');


%--------------------------------------------
% 7.1.d

figure
N=1024;
Fu1=fft(u1,N);
fline=linspace(-fs/2,fs/2,N);
subplot(311)
plot(fline,abs(fftshift(Fu1))/length(u1));
title('modulated with kp=pi/4');
xlabel('Frequency');
ylabel('amplitude');

N=1024;
Fu2=fft(u2,N);
fline=linspace(-fs/2,fs/2,N);
subplot(312)
plot(fline,abs(fftshift(Fu2))/length(u2));
title('modulated with kp=pi/2');
xlabel('Frequency');
ylabel('amplitude');

N=1024;
Fu3=fft(u3,N);
fline=linspace(-fs/2,fs/2,N);
subplot(313)
plot(fline,abs(fftshift(Fu3))/length(u3));
title('modulated with kp=pi');
xlabel('Frequency');
ylabel('amplitude');


