close all;
clear all;
clc;
N=input('Enter Number of Sensor required(5-1000):  ');
wsn_nodes=sort(rand(N,1));
range=.25;
a = 5;
b = 50;
Ei = a.*randn(N,1) + b
figure
stem(wsn_nodes,Ei);
%**********************************
%set of neighbours
N_Vi=zeors(N,1);
for i=1:N
%neighbour list
for j=i:N
    
    if ((wsn_nodes(j)-wsn_nodes(i)>=0) && Ei(i)>=1)
        N_Vi(i)=N_
        
end
end