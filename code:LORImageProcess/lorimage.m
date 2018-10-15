
% Created by Oguz Celikel Oct-15-2018

img = imread('LoR.jpg');
figure;
imshow(img);
title('original');
b = padarray(img,[1,1]);
ker1 = [0,-1,0 ; -1,5,-1; 0, -1, 0];
ker2 = ones(3)/9;
%ker1 = ker2;
for i=1:size(b,1)-2
    for j=1:size(b,2)-2
        for k=1:3
            temp=double(b(i:i+2,j:j+2,k)).*ker1;
            img1(i,j,k) = sum(temp(:));
        end
    end
end
img1=uint8(img1);
figure;
imshow(img1);
title('kernel1');