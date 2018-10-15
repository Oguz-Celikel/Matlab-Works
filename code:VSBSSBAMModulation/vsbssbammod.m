
% Created by Oguz Celikel Oct-15-2018

fm=400;
fc=2000;
fs=10000;
duration=30;
N=1024;
N1=50;
t=0:(1/fs):duration;
m1=1.5*sin(2*pi*fm*t);
c1=cos(2*pi*fc*t);

x1=m1.*c1;
[b,a]=butter(N1,fc/(fs/2),'high');
signal=filter(b,a,x1);
figure;
plot(abs(signal))

fourierx=fft(x1,N)*(1/fs);
fourierm=fft(m1,N)*(1/fs);
fourierfilter=fft(signal,N)*(1/fs);

xx1=linspace(-fs/2,fs/2,length(fourierx))
mx1=linspace(-fs/2,fs/2,length(fourierm))
filterx1=linspace(-fs/2,fs/2,length(fourierfilter))


subplot(3,1,1)
plot(mx1,fftshift(abs(fourierm)))
subplot(3,1,2)
plot(xx1,fftshift(abs(fourierx)))
subplot(3,1,3)
plot(filterx1,fftshift(abs(fourierfilter)))

c2=4*cos(2*pi*t);
Fc=[1600 2500];
[b,a]=butter(5,Fc./(fs/2),'bandpass')
g=filter(b,a,x1);
figure
plot(abs(g))
fourierg=fft(g1,N)*(1/fs);
fourierfilter=fft(g,N)*(1/fs);

xx1=linspace(-fs/2,fs/2,length(fourierx))
filterx1=linspace(-fs/2,fs/2,length(fourierfilter))


y=g*c2;
[b,a]=butter(N1,fc/(fs/2),'low');
signal1=filter(b,a,y);
figure
plot(abs(signal1))

fouriery=fft(signal1,N)*(1/fs);
fourierfilter=fft(signal,N)*(1/fs);

xx1=linspace(-fs/2,fs/2,length(fourierx))
filterx1=linspace(-fs/2,fs/2,length(fourierfilter))










