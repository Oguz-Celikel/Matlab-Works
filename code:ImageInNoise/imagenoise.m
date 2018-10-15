
% Created by Oguz Celikel Oct-15-2018

Fs = 256*256;
fc = 10000;
d = 1-1/Fs;
t = 0:1/Fs:d;
c = cos(2*pi*fc.*t);

img = imread('cameraman.tif');
img2 = im2double(img);
message = reshape(img2,1,Fs);

for i = 0:1:7
    
    Xdsb = message.*c;
    Xnoise = awgn(Xdsb, 5*i, 'measured').*c;

    n = 5;
    [b,a] = butter(n, fc/(Fs/2), 'low');

    y = 2*filter(b,a,Xnoise);

    yy = reshape(y,256,256);    

    
    subplot(2,4,1);
    imshow(img2);
    hold on;
    subplot(2,4,(i+1));
    imshow(yy);
    grid on;
end
