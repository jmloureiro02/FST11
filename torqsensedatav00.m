%% Arrays
t = table2array(r1(:,1))/1000000;
T = table2array(r1(:,2));
S = table2array(r1(:,3));
%P = table2array(r1(:,4));

%% Torque Plot
subplot(2,1,1)
plot(t,T)
title('Torque');
legend('Torque');
xlabel('Time (s)');
ylabel('Torque (Nm)');

%% Speed Plot
subplot(2,1,2)
plot(t,S,'r')
title('Speed');
legend('Speed');
xlabel('Time (s)');
ylabel('Speed (rpm)');

%% Power Plot
%subplot(3,1,3)
%plot(t,P,'m')
%title('Power');
%legend('Power');
%xlabel('Time (s)');
%ylabel('Power (W)');
