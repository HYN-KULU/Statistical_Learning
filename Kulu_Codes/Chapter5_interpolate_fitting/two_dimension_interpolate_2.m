clear,clc
x=100:100:500;
y=100:100:400;
z=[636    697    624    478   450  
   698    712    630    478   420
   680    674    598    412   400
   662    626    552    334   310];
xi=100:10:500;yi=100:10:500;
z0=interp2(x,y,z,xi,yi,'method')