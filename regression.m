clear all; close all; clc

% Add APMonitor toolbox available from
% http://apmonitor.com/wiki/index.php/Main/MATLAB
addpath('apm')

% server and application
s = 'http://byu.apmonitor.com';
a = 'regression';

% clear any prior application
apm(s,a,'clear all');

% load model and data files
apm_load(s,a,'model.apm');
csv_load(s,a,'data.csv');

% configure parameters to estimate
apm_info(s,a,'FV','a');
apm_info(s,a,'FV','b');
apm_info(s,a,'FV','c');
apm_option(s,a,'a.status',1);
apm_option(s,a,'b.status',1);
apm_option(s,a,'c.status',1);
apm_option(s,a,'nlc.imode',2);

% solve nonlinear regression
output = apm(s,a,'solve');
disp(output)

% retrieve solution
y = apm_sol(s,a);
z = y.x;

% print solution
disp(['Solution'])
disp(['a = ' num2str(z.a(1))])
disp(['b = ' num2str(z.b(1))])
disp(['c = ' num2str(z.c(1))])

% plot solution
figure(1)
plot(z.xm,z.ym,'o');
hold on
plot(z.xm,z.y,'x');
xlabel('x')
ylabel('y')
legend('Measured','Predicted')

