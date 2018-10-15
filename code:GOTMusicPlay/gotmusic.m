
% Created by Oguz Celikel Oct-15-2018

Fs = 8000;
G5 = 784;
E5 = 659;
C5 = 523;
F5 = 698;

tnote = [1/4,1/4,1/4,1/4,1/4,1/4,1/4,1/4,1/4,1/4,1/4,1/4,1/4,1/4,1/4,1/4,1,1,1/8,1/4,1,1,1/4,1/4];
notes = [G5 C5 E5 F5 G5 C5 E5 F5 G5 C5 E5 F5 G5 C5 E5 F5 G5 C5 C5 F5 G5 C5 E5 F5];
%a = [];
b = [];

for i= 1:1:length(tnote)
    f = notes(1,i);
    t = 0:1/Fs:tnote(1,i);
    a = sin(2*pi*f*t);
    b = [b a];
end

soundsc(b,Fs)
