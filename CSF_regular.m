function d_final=CSF_regular(d_actual,m,Ps,dm,Tech)
%Compressive sparse function code
%N=input('Enter the number sensor:  ');
%m=input('Enter the number of active sensors:  ');
%data_type = input('enter data type: 1=normal 2=abnormal 3=practical 4=sinusoildal:  ');
[t,N]=size(d_actual);
P=zeros(N,N);
i=0,j=0;
for i=1:N
    for j=1:N
        P(i,j)=sqrt(2/N)*cos((pi/N)*(i-1+.5)*(j-1+.5));
    end
end
theta=Ps;
x0 = theta.'*dm';             % x0 intial guess value for recovery
X_hat = l1eq_pd(x0, theta, [], dm');  %recovery using prime dual interior point method

d_final=P*X_hat;

    plot(1:N,d_actual,'-or')
    xlabel('Sensors');
    ylabel('Sensor readings'); 
    hold on
    plot(1:N,d_final,'-*b')
    hold on
    if Tech==2
        legend('Original Sensor data','CSF reconstructed data');
    else
        legend('Original Sensor data','CDG and CSF combined reconstruction of data');
    end
    title('Sensors and their readings');
end




