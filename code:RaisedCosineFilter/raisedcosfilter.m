
% Created by Oguz Celikel Oct-15-2018

clear all

M=16;
m_x= randi([0 15],500,1);
m_y= qammod(m_x,M);
scatterplot(m_y);
grid on;

Fd=200;
Fs=10000;
R=0.5;
delay=2;

f_y= rcosflt(m_y, Fd, Fs , 'fir', R, delay);
eyediagram(f_y,Fs/Fd) ;

gdelay = Fs/Fd * 2 * delay + 1 ;
b = length(f_y) - gdelay ;
f_yt=f_y(gdelay+1 : b ) ;
eyediagram(f_yt,Fs/Fd) ; 

M1=4;
delay1=4;
m_x2= randi([0 3],500,1);
m_y2= qammod(m_x2,M1);
scatterplot(m_y2);
grid on;
f_y2= rcosflt(m_y2, Fd, Fs , 'fir', R, delay1);
eyediagram(f_y2,Fs/Fd) ;

gdelay1 = Fs/Fd * 2 * delay1 + 1 ;
c = length(f_y2) - gdelay1 ;
f_yt2=f_y2(gdelay1+1 : c ) ;
eyediagram(f_yt2,Fs/Fd) ; 

