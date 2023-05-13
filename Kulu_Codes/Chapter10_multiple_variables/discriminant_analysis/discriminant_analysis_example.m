clc,clear
a=[24.8   24.1   26.6  23.5   25.5  27.4
-2.0  -2.4   -3.0   -1.9   -2.1   -3.1]';
b=[22.1  21.6   22.0  22.8   22.7  21.5   22.1   21.4
-0.7  -1.4   -0.8  -1.6   -1.5  -1.0  -1.2  -1.3]';
n1=6;n2=8;
mu1=mean(a), mu2=mean(b) %计算两个总体样本的均值向量,注意得到的是行向量
sig1=cov(a);sig2=cov(b); %计算两个总体样本的协方差矩阵
sig=((n1-1)*sig1+(n2-1)*sig2)/(n1+n2-2) %计算两总体公共协方差阵的估计
beta=log(8/6)
syms x1 x2
x=[x1 x2];  

wx=vpa(wx,6)  %显示判别函数
ahat=subs(wx,{x1,x2},{a(:,1),a(:,2)})';  %计算总体1样本的判别函数值
bhat=subs(wx,{x1,x2},{b(:,1),b(:,2)})';  %计算总体2样本的判别函数值
ahat=vpa(ahat,6), bhat=vpa(bhat,6) %显示6位数字的符号数
sol1=(ahat>beta),  sol2=(bhat<beta)   %回代，计算误判
