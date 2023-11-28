close all;
clear all;
clc;

% Wireless sensor network statistics

rng(0);                 % set RNG seed
disp('*** What type of data you want sir? ***');
I_or_D=input('Enter: 1=image  2= Sensor data:  ')
if I_or_D==1
    [d N M] = collect_image_data();
elseif I_or_D==2
    N=input('Enter Number of Sensor required(5-1000):  ');
    M=input('Enter the Number of Observations required(m=klog(N)):  ');
    data_type = input('enter data type: 1=normal 2=abnormal 3=practical 4=sinusoildal:  ');
    %Sensor data generation fuction
    d=data_collection(data_type,N);
end

if(I_or_D==2)
    [x_csf,X_hat]=csf_function(d,N,M,I_or_D);
    figure
    plot(1:N,x_csf,'--r')
    hold on
    plot(1:N,d,'--b')
    hold on
    legend('DCT','Original')
end