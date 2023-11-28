function [dm,Ps]=cdg_csf_function(N,m,data_type)
%Compressive sparse function code
P=zeros(N,N);
i=0,j=0;
for i=1:N
    for j=1:N
        P(i,j)=sqrt(2/N)*cos((pi/N)*(i-1+.5)*(j-1+.5));
    end
end
rest=N-m;
rl=N/rest;
r=ceil(rl);

c=0;
    for k=1:N
        c=c+1;
        if c ~= r
            sensorid(k)=k;
        end
        if c == r;
            c=0;
             sensorid(k)=0;
        end
        
    end
    
 p=0
        for j=1:N
            
            if sensorid(j) ~= 0
                p=p+1;
               activated_sensor_id(p) = sensorid(j);
            end
        end
Ps=zeros(m,N);
[h,m]=size(activated_sensor_id);
for k=1:m
    Ps(k,:)=P(activated_sensor_id(k),:);
end
d  = data_collection(data_type,N);
for k=1:m
    dm(k)=d(activated_sensor_id(k));
end
end