function xp=proj_l1_cvx(y,alpha)
% input
% y - vector to project
% alpha - pos scalar
%output
% xp - projection
cvx_begin
variable xp(length(y))
f = norm(xp-y)
g = sum(abs(xp))
minimize(f)
subject to
g <= alpha;
cvx_end
end
