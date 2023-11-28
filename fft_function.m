function x_hat= fft_function(d,N,M,I_or_D)
x=d';
Psi = dftmtx(N);
Psi_inv = conj(Psi)/N;
X = Psi*x;             
theta = randn(M,N)*Psi;      % sensing matrix
y = theta*X;                %  measured values to transmit

% Perform Compressed Sensing recovery
x0 = theta.'*y;
%X_hat = l1eq_pd(x0, theta, [], y, 1e-5);
X_hat = l1eq_pd(x0, theta, [], y);
% Plot signals
amp = 1.2*max(abs(x));
figure; subplot(5,1,1); plot(x); xlim([1 N]); ylim([-amp amp]);
title('x(t)')
subplot(5,1,2); plot(abs(X)); xlim([1 N]);
title(' fft mag(X(f))');
subplot(5,1,3); plot(abs(X_hat)); xlim([1 N]);
title('fft mag(Xhat)');

x_hat = real(Psi_inv*X_hat);    % IFFT of X_hat(f)

subplot(5,1,4); plot(x_hat); xlim([1 N]);  ylim([-amp amp]);
title('fft xhat');
