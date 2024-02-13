l= [ 1 0.88 0.66 0.46 0.35 0.20 0.15 0.12 0.12 0.11 0.10]
m= [1:1:11];
p=polyfit(m,l,1)
y_fit=polyval(p,m)
plot(m,l,'ro',m,y_fit)
