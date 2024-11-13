function [X, tnn, trank] = prox_tnn_psi(Y, rho, psi)


[n1, n2, n3] = size(Y);
max12 = max(n1, n2);
X = zeros(n1, n2, n3); 
Y = fft(Y, [], 3);
tnn = 0;
trank = 0;

% first frontal slice
[U, S, V] = svd(Y(:, :, 1), 'econ');
S = diag(S);
S = prox_psi(S, rho, psi);
tol = max12 * eps(max(S));
r = sum(S > tol);
S = S(1:r);
X(:, :, 1) = U(:, 1:r) * diag(S) * V(:, 1:r)';
tnn = tnn + sum(S);
trank = max(trank, r);

% i=2,...,halfn3
halfn3 = round(n3/2);
for i = 2:halfn3
    [U, S, V] = svd(Y(:, :, i), 'econ');
    S = diag(S);
    S = prox_psi(S, rho, psi);
    tol = max12 * eps(max(S));
    r = sum(S > tol);
    S = S(1:r);
    X(:, :, i) = U(:, 1:r) * diag(S) * V(:, 1:r)';
    X(:, :, n3+2-i) = conj(X(:, :, i));
    tnn = tnn + sum(S) * 2;
    trank = max(trank, r);
end

% if n3 is even
if mod(n3, 2) == 0
    i = halfn3 + 1;
    [U, S, V] = svd(Y(:, :, i), 'econ');
    S = diag(S);
    S = prox_psi(S, rho, psi);
    tol = max12 * eps(max(S));
    r = sum(S > tol);
    S = S(1:r);
    X(:, :, i) = U(:, 1:r) * diag(S) * V(:, 1:r)';
    tnn = tnn + sum(S);
    trank = max(trank, r);
end
tnn = tnn / n3;
X = ifft(X, [], 3);
