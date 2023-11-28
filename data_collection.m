function d = data_collection(data_type,N)
k=.1;
if(data_type==2)
    f=textread('abnormal.txt');
    for i=1:N
        
        d(i)=f(i);
    end
elseif (data_type==1)
    for i=1:N
        
        d(i)=20+i*k;
        %d(i)=20;
        
    end
elseif(data_type==3)
    f=textread('temperature.txt');
    for i=1:N
        
        d(i)=f(i);
    end
elseif(data_type==4)
    P=2;
    freq = randperm(N)-1;
    freq = freq(1:P).';
    n = 0:N-1;
    d = sum(sin(2*pi*freq/N*n).', 2)';
else
    disp('*********************Please enter valid input !!!! **********************************');
end
