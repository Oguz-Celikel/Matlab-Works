
% Created by Oguz Celikel Oct-15-2018

clc
clear all

%-----------------------------------------------------
%8. Exponential Distribution and Central Limit Theorem
%-----------------------------------------------------

%-------------------------------------
%8.a
%-------------------------------------

Md = 5;
Cd = 1:25000;

X = exprnd(Md,1,25000);

%-------------------------------------
%8.b
%-------------------------------------

Y=[];
for i = 1:1:25000
   Y = [Y var(X(1:i))];
end

figure;
plot(Cd,Y);
grid on;

%X1 = exprnd(Md,1,N);
%A = [A mean(X1(1:j))];
%A = [];

%-------------------------------------
%8.c
%-------------------------------------

N=100;
c = [];
for j = 1:1:25000
    rand = randi(25000,N,1);
    summ = 0;
    for k = 1:N
        summ = summ + X(rand(k));
    end
    c = [c summ/N]; 
end

figure;
histfit(c);

% for k =1:N
%     c = [c mean(X(rand(k)))];
% end

% figure;
% plot(1:N,A);
% grid on;

% figure;
% plot(c);
% grid on;


