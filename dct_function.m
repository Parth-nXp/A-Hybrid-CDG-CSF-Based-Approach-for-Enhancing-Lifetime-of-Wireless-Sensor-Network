function x_hat=dct_function(d,N,M,I_or_D)
Phi = randn(M, N);
Psi=dctmtx(N);
theta=Phi*inv(Psi);
%Sensor Random data generation of M samples
temp=0;
for m=1:M
    for n=1:N
       temp=d(n)*Phi(m,n)+temp;
    end
    y(m)=temp;
    temp=0;
end
x0 = theta.'*y';             % x0 intial guess value for recovery
X_hat = l1eq_pd(x0, theta, [], y');  %recovery using prime dual interior point method

x_hat=inv(Psi)*X_hat;

if I_or_D==2
figure; 
subplot(5,1,1); 
plot(d); 
title(' N valued original senosr data   d');
maximum=1.1*max(d);
minimum=.9*min(d);
xlim([1 N]);ylim([minimum maximum]);


X=dct(d);
subplot(5,1,2); 
plot(X); 
title(' DCT data X'); 
xlim([1 N]);

subplot(5,1,3); 
plot(y); 
title(' compressed data   y'); 
xlim([1 M]);

subplot(5,1,4); 
plot(X_hat); 
title(' DCT of recovered data'); 
xlim([1 N]);

subplot(5,1,5); 
plot(x_hat');
title(' recovered data'); 
xlim([1 N]);
ylim([minimum maximum]);
elseif I_or_D==1
figure('name','Compressive sensing image reconstructions')
subplot(1,2,1), imagesc(reshape(d,50,50)), xlabel('original'), axis image
%subplot(1,3,2), imagesc(reshape(X_hat,50,50)), xlabel('least squares'), axis image
subplot(1,2,2), imagesc(reshape(x_hat,50,50)), xlabel('recovered'), axis image
colormap gray
end