randn('seed', 317);
rand('seed', 317);
n = 10;
Q = orth(randn(n, n));
D = randperm(2*n)';
D = diag(sort(D(1:n) .* sign(randn(n, 1))));
A = Q*D*Q';
b = 20*rand(n, 1)-15;
alpha = 3;
disp(b'*Q(:, 1)); % The condition is satisfied.

eps = 1e-5;

x_bisection = TRS(A, b, alpha, eps, 'Bisection');

x_newton = TRS(A, b, alpha, eps, 'Newton');