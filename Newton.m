function [ lambda ] = Newton( A, b, lambda_0, alpha, eps )
eigenvals = eigs(A);
min_eig = min(eigenvals);
lambda = inf; 
lambda_next = lambda_0;
i = 0;

while abs(lambda_next - lambda) > eps
    lambda = lambda_next;
    R = chol(A + lambda*eye(length(A)));
    p = -(R'*R)\b;
    q = R'\p;
    lambda_next = max(lambda + ((norm(p)/norm(q))^2)*((norm(p)-alpha)/alpha), ...
        -min_eig + 1e-7);
    i = i + 1;    
    fprintf('iteration %3d, value %2.6f \n', i, lambda_next);
end