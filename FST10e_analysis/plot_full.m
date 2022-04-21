%% Full Data Plot

%% Data Fetching  ->  0 - Front Right | 1 - Front Left | 2 - Rear Right | 3 - Rear Left

vel = data.amk_actual_speed3.resampled.Data; %[rpm]
%vel = rpm;
T_Iq = data.amk_torque_c3.resampled.Data;    %[A]
T = ((T_Iq*107.2)/16384)*0.26*1000;          %[Nm] (*1000 to facilitate visual analysis)
%T = tq;
t = data.amk_torque_c3.resampled.Time;       %[s]

figure;
hold on;

%% speed plot
plot(t,vel);

%% torque plot
plot(t,T);

%% Break full run into segments

n_runs = 1;

% run 1
idx(:,1) = data.amk_torque_c3.resampled.Time > 2.15 & data.amk_torque_c3.resampled.Time < 106.9;

% run 2
idx(:,2) = data.amk_torque_c3.resampled.Time > 1 & data.amk_torque_c3.resampled.Time < 2;

% run 3
idx(:,3) = data.amk_torque_c3.resampled.Time > 1 & data.amk_torque_c3.resampled.Time < 2;