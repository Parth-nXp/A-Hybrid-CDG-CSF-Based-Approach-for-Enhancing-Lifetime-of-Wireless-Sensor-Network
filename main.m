close all;
clear all;
clc;

% Wireless sensor network statistics

rng(0);                 % set RNG seed
disp('*** What type of data you want sir? ***');
I_or_D=input('Enter: 1=image  2= Sensor data:  ');
if I_or_D==1
    [d N M] = collect_image_data();
elseif I_or_D==2
    n=input('Enter Number of Sensors required(5-1000):  ');
    disp('***Select the Technique ***');
    Tech=input('Enter: 1=CDG        2=CSF     3=CDG and CSF combined    ');
    if Tech ~=1
        m=input('Enter the number of active sensors:  ');
    else
        m=n;
    end
    disp('***Select the Type of data***');
    data_type = input('Enter data type: 1=normal   2=abnormal  3=practical   4=sinusoildal:  ');
    disp('***which sensing matrix you need? ***');
    SenMat  =   input(' Enter: 1=normal sensing matrix         2=modified sensing matrix   ');
   
    %Sensor data generation fuction
    d_actual = data_collection(data_type,n);
    [d,Ps]=cdg_csf_function(n,m,data_type);
end
[f_actual,N_actual]=size(d_actual);
[f,N]=size(d);
err_list=zeros(1,N);
M_by_N_list=zeros(1,N);
for i=1:200
M_by_N=.05;
c=1;
err=.05;
while(err>.02)
M=floor(N*M_by_N);
if(I_or_D==2)
    if SenMat==1
        x_dct=dct_function(d,N,M,3);
    else
        x_dct=dct_function_modified(d,N,M,3);
    end
elseif(I_or_D==1)
    x_dct=dct_function(d,N,M,3);
end
err=(norm(x_dct-d')/norm(d'));
err_list(c)=err+err_list(c);
M_by_N_list(c)=M_by_N;
c=c+1;
M_by_N = M_by_N+0.01;
if M>=N
    err=.01
      break;
  end
end
end
if Tech~=1
    if Tech==2
        d_final=CSF_regular(d_actual,m,Ps,d,Tech);
    else
        d_final=CSF_regular(d_actual,m,Ps,x_dct',Tech);
    end
end
if Tech==1
if(I_or_D==2)
    %x_fft=fft_function(d,N,M,I_or_D);
    %x_dct=dct_function(d,N,M,I_or_D);
    figure
    %plot(1:N,x_fft,'--g')
    %hold on
    plot(1:N,x_dct,'-or')
    xlabel('Sensors');
    ylabel('Sensor readings'); 
    hold on
    plot(1:N,d,'--b')
    hold on
    legend('CDG Reconstructed','CDG Original');
    title('Sensors and their readings');
    %legend('FFT','DCT','Original');
elseif(I_or_D==1)
    %x_dct=dct_function(d,N,M,I_or_D);
    %x_fft=fft_function(d',N,M,I_or_D);
    figure('name','Compressive sensing image comparision')
    subplot(1,3,1), imagesc(reshape(d,50,50)), xlabel('original'), axis image
    %subplot(1,3,2), imagesc(reshape(x_fft,50,50)), xlabel('fft recovered'), axis image
    subplot(1,3,3), imagesc(reshape(x_dct,50,50)), xlabel('dct recovered'), axis image
    colormap gray
end
end

figure('name','Performance of compressive sensing with different m/N ratio')
average_err_list=err_list/200;
plot(M_by_N_list,average_err_list,'-ob');
ylim([0,.4]);
xlim([.1,1]);
xlabel('m/N');
ylabel('Recover Error');
title('Performance of compressive sensing with different m/N ratio');

