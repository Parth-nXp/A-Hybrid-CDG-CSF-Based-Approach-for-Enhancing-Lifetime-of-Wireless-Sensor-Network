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
    %M=input('Enter the Number of Observations required(m=klog(N)):  ');
    data_type = input('enter data type: 1=normal 2=abnormal 3=practical 4=sinusoildal:  ');
    %Sensor data generation fuction
    d=data_collection(data_type,N);
end
M_by_N=.05;
M=floor(N*M_by_N);
if(I_or_D==2)
    x_dct=dct_function(d,N,M,3);
elseif(I_or_D==1)
    x_dct=dct_function(d,N,M,3);
end
err=(norm(x_dct-d')/norm(d'));
err_list=zeros(1,20);
M_by_N_list=zeros(1,20);
M_by_N_list(1)=M_by_N;
err_list(1)=err;
c=2;
while (err>=.01)
if(I_or_D==2)
    x_dct=dct_function(d,N,M,3);
elseif(I_or_D==1)
    x_dct=dct_function(d,N,M,3);
end
  err=(norm(x_dct-d')/norm(d'));
  err_list(c)=err;
  M_by_N = M_by_N+0.01;
  M_by_N_list(c)=M_by_N;
  c=c+1;
  M=floor(N*M_by_N)
  if M>=N
      break;
  end
end
if(I_or_D==2)
    %x_fft=fft_function(d,N,M,I_or_D);
    %x_dct=dct_function(d,N,M,I_or_D);
    figure
    %plot(1:N,x_fft,'--g')
    %hold on
    plot(1:N,x_dct,'-or')
    hold on
    plot(1:N,d,'--b')
    hold on
    legend('DCT','Original');
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

figure
plot(M_by_N_list,err_list);
ylim([.0001,1]);