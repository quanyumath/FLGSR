function [tnn, vecS] = tnn_psi(X, psi)

n3 = size(X, 3);
X = fft(X, [], 3);
tnn = 0;
vecS = [];
% i=1
s = svd(X(:, :, 1), 'econ'); vecS = [vecS, s];
tnn = tnn + sum(Psi(s, psi));

% i=2,...,halfn3
halfn3 = round(n3/2);
for i = 2:halfn3
    s = svd(X(:, :, i), 'econ'); vecS = [vecS, s, s];
    tnn = tnn + sum(Psi(s, psi)) * 2;
end

% if n3 is even
if mod(n3, 2) == 0
    i = halfn3 + 1;
    s = svd(X(:, :, i), 'econ'); vecS = [vecS, s];
    tnn = tnn + sum(Psi(s, psi));
end
tnn = tnn / n3;
