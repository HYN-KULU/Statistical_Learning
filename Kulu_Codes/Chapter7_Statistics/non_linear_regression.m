clc, clear
xy0=[8.55	470	300	10
3.79	285	80	10
4.82	470	300	120
0.02	470	80	120
2.75	470	80	10
14.39	100	190	10
2.54	100	80	65
4.35	470	190	65
13.00	100	300	54
8.50	100	300	120
0.05	100	80	120
11.32	285	300	10
3.13	285	190	120];
x=xy0(:,[2:4]);
y=xy0(:,1);
huaxue=@(beta,x) (beta(4)*x(:,2)-x(:,3)/beta(5))./(1+beta(1)*x(:,1)+...
beta(2)*x(:,2)+beta(3)*x(:,3)); %用匿名函数定义要拟合的函数
beta0=[0.1,0.05,0.02,1,2]';  %回归系数的初值,可以任意取，这里是给定的
[beta,r,j]=nlinfit(x,y,huaxue,beta0)  %计算回归系数beta; r,j是下面命令用的信息
betaci=nlparci(beta,r,'jacobian',j)  %计算回归系数的置信区间
[yhat,delta]=nlpredci(huaxue,x,beta,r,'jacobian',j) %计算y的预测值及置信区间半径