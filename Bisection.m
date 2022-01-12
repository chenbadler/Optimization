function z = Bisection( f, lower, upper, eps )
if (f(lower)*f(upper)>0)
    error('f(lower)*f(upper)> 0')
end
i = 0;
while (upper - lower > eps)
    z=(lower + upper)/2;
    i = i + 1;
    if(f(lower)*f(z)>0)
        lower = z;
    else
        upper = z;
    end
    fprintf('iteration %3d, value %2.6f \n',i,z);
end