filtername='db4';
levels = 3;
delta32 = [zeros(31,1); 1; zeros(32,1)];
N=length(delta32);
W=WaveletMatrix_nL(N,levels,filtername)
delta32_dwt = W*delta32;
for dval=1:levels
D(dval).coeffs = delta32_dwt((N/(2^(dval)))+1:(N/(2^(dval-1))));
if (dval == levels)
A(dval).coeffs = delta32_dwt(1:(N/(2^(dval))));
end
end