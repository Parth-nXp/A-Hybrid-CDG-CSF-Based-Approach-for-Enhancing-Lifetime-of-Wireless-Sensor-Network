%Compressive sparse function code
clear all;
close all;
N=input('Enter the number of sensor:  ');
m=input('Enter the number of active sensors: ');
data_type = input('enter data type: 1=normal 2=abnormal 3=practical 4=sinusoildal:  ');
Pr=randperm(N);
r=sort(Pr(1:m));
P=zeros(N,N);
for i=1:N
    for j=1:N
        P(i,j)=sqrt(2/N)*cos((pi/N)*(i-1+.5)*(j-1+.5));
    end
end
Ps=zeros(m,N);
for k=1:m
    Ps(k,:)=P(r(k),:);
end
d  = data_collection(data_type,N);
for k=1:m
    dm(k)=d(r(k));
end
theta=Ps;
x0 = theta.'*dm';             % x0 intial guess value for recovery
X_hat = l1eq_pd(x0, theta, [], dm');  %recovery using prime dual interior point method

x_hat=P*X_hat;
    plot(1:N,d,'-or')
    xlabel('Sensors');
    ylabel('Sensor readings'); 
    hold on
    plot(1:N,x_hat,'-*b')
    hold on
    legend('Original','Reconstructed');
    title('Sensors and their readings');