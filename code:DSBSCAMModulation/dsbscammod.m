
% Created by Oguz Celikel Oct-15-2018

fm = 5000;
fc = 100000;
Fs = 400000;
d = 0.002;
t = 0:(1/Fs):d;

m = sin(2*pi*fm.*t);
c = cos(2*pi*fc.*t);
Xdsb = m.*c;

% figure;
% subplot(311);
% plot(t,m);
% hold on;
% subplot(312);
% plot(t,c);
% hold on;
% subplot(313);
% plot(t,Xdsb);
% grid on;

Nn1 = 3;
[b1,a1] = butter(Nn1, fc/(Fs/2), 'high');
Nn2 = 60;
[b2,a2] = butter(Nn2, fc/(Fs/2), 'high');

h1 = freqz(b1,a1);
h2 = freqz(b2,a2);

figure;
subplot(211);
plot(abs(h1));
hold on;
subplot(212);
plot(abs(h2));
grid on;

y1 = filter(b1,a1,Xdsb);
y2 = filter(b2,a2,Xdsb);

N=1024;
xy1 = fft(y1,N);
xy2 = fft(y2,N);
xXdsb = fft(Xdsb,N);

f = linspace(-Fs/2,Fs/2,N);

figure;
subplot(311);
plot(f,abs(fftshift(xXdsb)));
hold on;
subplot(312);
plot(f,abs(fftshift(xy1)));
hold on;
subplot(313);
plot(f,abs(fftshift(xy2)));
grid on;
%-----------------------------------------------
%Demodulation of DSB-SC AM Signal
[b3,a3] = butter(10,(2*fm)/(Fs/2),'low');

dd = y2.*cos(2*pi*fc.*t);

filtered = filter(b3,a3,dd);
xfiltered = fft(4*filtered,N);
%-----------------------------------------------

xm = fft(m,N);

figure;
subplot(211);
plot(f,abs(fftshift(xm)));
hold on;
subplot(212);
plot(f,abs(fftshift(xfiltered)));
hold on;

figure;
plot(t,m);
hold on;
plot(t,4*filtered);
grid on;

























