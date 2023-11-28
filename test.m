close all;
clear all;
clc;
N=4;
M=2;
for i=1:N
    for j=1:N
        Psi(i,j)=sqrt(2/N)*cos((pi/N)*(i-1+.5)*(j-1+.5));
    end
end
random_list=sort(datasample(1:N,M,'Replace',false));
for i=1:M
        Psir(i,:)=Psi(random_list(i),:);
end

