
% Created by Oguz Celikel Oct-15-2018

q1 = 5;
q2 = 25;
q3 = 100;

wind = load('Karaburun_windSpeed.mat');
%windc = struct2cell(wind);
%windm = cell2mat(windc);

result = zeros(length(wind.y),1);
result2 = zeros(length(wind.y),1);
result3 = zeros(length(wind.y),1);

for t = 1+q1:length(wind.y)-q1
    for i = -q1:1:q1 
        %if t - q1 >= 1 && t + q1 <= length(wind.y) 
            
            result(t,1) = result(t,1) + wind.y(t+i,1)/(2*q1+1) ; 
            
        %else
            
            %result(t,1) = wind.y(t,1);
            
        %end
    end
    
end

for t = 1+q2:1:length(wind.y)-q2
    for i = -q2:1:q2 
        %if t - q2 >= 1 && t + q2 <= length(wind.y) 
            
            result2(t,1) = result2(t,1) + wind.y(t+i,1)/(2*q2+1) ; 
            
        %else
            
            %result2(t,1) = wind.y(t,1);
            
        %end
    end
    
end

for t = 1+q3:1:length(wind.y)-q3
    for i = -q3:1:q3 
        %if t - q3 >= 1 && t + q3 <= length(wind.y) 
            
            result3(t,1) = result3(t,1) + wind.y(t+i,1)/(2*q3+1) ; 
            
        %else
            
            %result3(t,1) = wind.y(t,1);
            
        %end
    end
    
end


plot(wind.y,  'r');
hold on
plot(result,  'b--', 'LineWidth',2);
hold on
plot(result2, 'g-.', 'LineWidth',2);
hold on
plot(result3, 'y--', 'LineWidth',2);
grid on

xlabel('time series');
ylabel('speed of wind');
title('Moving Average');
legend('data','11-Term','51-Term','201-Term');
