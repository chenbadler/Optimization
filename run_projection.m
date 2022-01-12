y_1 = [0 1 -0.5 0.8 1.2 -0.3]';

x_1 = proj_l1(y_1, 0.5);
x_2 = proj_l1_cvx(y_1, 0.5);

rand('seed',314);
y=rand(10000,1);
tic,x=proj_l1(y,0.5);toc
tic,x=proj_l1_cvx(y,0.5);toc
