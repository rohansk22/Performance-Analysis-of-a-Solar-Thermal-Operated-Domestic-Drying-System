y = [1.00 0.9466 0.87 0.6033 0.41 0.366 0.35 0.333 0.3233 0.3233 ] 
x = [8:1:17];
p=polyfit(x,y,1)
y_fit=polyval(p,x)
plot(x,y,'ro',x,y_fit)