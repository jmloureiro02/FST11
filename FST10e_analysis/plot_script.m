%% Single Run Analysis

%% Input Data
clc;
close all;
input_file = 'data_fsg_autox_21_run4';
load(input_file);

%% Number of Clusters
n_cluster = 7;

hold on;

n_runs = 1;%

% N run analysis
for k = 1:n_runs
    %% Data Fetching  ->  0 - Front Right | 1 - Front Left | 2 - Rear Right | 3 - Rear Left
    vel = data.amk_actual_speed3.resampled.Data(idx(:,1)); %[rpm]
    %vel = rpm;
    T_Iq = data.amk_torque_c3.resampled.Data(idx(:,1));    %[A]
    T = ((T_Iq*107.2)/16384)*0.26*1000;                    %[Nm] (*1000 to facilitate visual analysis)
    %T = tq;

    %% speed plot
    plot(data.amk_torque_c3.resampled.Time(idx(:,1)),vel,'o');

    %% torque plot
    plot(data.amk_torque_c3.resampled.Time(idx(:,1)),T,'o');

    %% Discard negative values
    vel = vel(T>=0);
    T = T(T>=0);
    vel = vel(vel>=0);
    T = T(vel>=0);
    
    %% 2D plot: x - speed ; y - torque
    figure;
    plot(vel,T,'o');

    %% 3D plot: x - speed ; y - torque ; z - Power = x*y
    figure;
    U = vel.*T;
    scatter3(vel,T,U,36,U);

    %% K means
    X =[vel,T,U];
    [id,C] = kmeans(X,n_cluster);

    %% Cluster plot
    figure;
    scatter3(vel,T,U,15,id,'o');
    hold on;

    %% Centroid plot
    for i = 1:n_cluster
        scatter3(C(i,1),C(i,2),C(i,3),50,'d','LineWidth',1.25);
    end
    run centroid;
end
