function xp = proj_l1(y,alpha)
% input
% y - vector to project
% alpha - pos scalar
%output
% xp - projection
if alpha == 0
    xp = zeros(length(y),1);
    return;
end
if sum(abs(y))<= alpha
    xp = y;
    return;
end
h = @(lam)sum(max(abs(y)-lam,0))-alpha;
n = length(y);
lb = min(abs(y))-(2*alpha/n);
ub = max(abs(y));
lam = Bisection(h,lb,ub,1e-10)
xp = sign(y).*max(abs(y)-max(0,lam),0)
end