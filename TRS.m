function [ x ] = TRS( A, b, alpha, eps, method)
phi = @ (lambda) norm((A+lambda*eye(length(A)))\b) - alpha;
lower = 1e-7;
upper = max(lower, 1);
while(phi(upper) > 0)
    upper = 2*upper;
end

eigenvals = eigs(A);
is_PD = sum(eigenvals <= 0) == 0;

if is_PD
    x_naive = -A\b;
    if norm(x_naive)^2 <= alpha^2
        x = x_naive;
    else
        if strcmp(method, 'Bisection')
            lambda = Bisection(phi, lower, upper, eps);
        else 
            lambda = Newton(A, b, upper, alpha, eps);
        end
        x = -(A+lambda*eye(length(A)))\b;
    end
else
    if strcmp(method, 'Bisection')
        lambda = Bisection(phi, lower, upper, eps);
    else 
        lambda = Newton(A, b, upper, alpha, eps);
    end
    x = -(A+lambda*eye(length(A)))\b;
end
end