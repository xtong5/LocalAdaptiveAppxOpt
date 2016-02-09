%% Create Pictures for Traub Memorial Issue Paper
% This script creates figures for 
%
% S.-C. T. Choi, Y. Ding, F. J. Hickernell, X. Tong, " ...

InitializeWorkspaceDisplay %initialize the workspace and the display parameters
MATLABBlue = [0, 0.447, 0.741];
MATLABOrange = [0.85,  0.325, 0.098];
MATLABPurple = [0.494,  0.184, 0.556];
MATLABGreen = [0.466,  0.674, 0.188];
MATLABDkOrange = [0.85,  0.325, 0.098]*0.6;
MATLABLtOrange = 0.5*[0.85,  0.325, 0.098] + 0.5*[1 1 1];

%% Sample functions with wildy oscillating second derivatives
f1 = @(x) x.^4 .* sin(1./x);
f1pp = @(x) (12*x.^2 - 1) .* sin(1./x) - 6*x .* cos(1./x);
f2 = @(x) f1(x) + 10.*x.^2;
f2pp = @(x) f1pp(x) + 20;
xplot = (-1:.001:1);
h = plot(xplot,f1(xplot),'-','color',MATLABBlue);
hold on
h=[h,plot(xplot,f2(xplot),'-','color',MATLABOrange)];
axis([-1 1 -1 11])
xlabel('\(x\)')
legend(h,{'\(f_1(x)\)', '\(f_2(x)\)'},'location', 'north','box','off')
print -depsc f1f2plot.eps

figure
xplotclose = (-0.02:0.00001:0.02)';
h = plot(xplotclose,f1(xplotclose),'-','color',MATLABBlue);
%axis([-1 1 -1 11])
xlabel('\(x\)')
legend(h,{'\(f_1(x)\)'},'location', 'north','box','off')
print -depsc f1closeplot.eps

figure
xplotclose = (-0.02:0.00001:0.02)';
h = plot(xplotclose,f2(xplotclose),'-','color',MATLABOrange);
axis([-0.02 0.02 -5e-4 4.5e-3])
xlabel('\(x\)')
legend(h,{'\(f_2(x)\)'},'location', 'north','box','off')
print -depsc f2closeplot.eps

figure
h = plot(xplot,f1pp(xplot),'-',xplot,f2pp(xplot),'-');
axis([-1 1 -7 27])
xlabel('\(x\)')
legend(h,{'\(f''''_1(x)\)', '\(f''''_2(x)\)'},'location','best','box','off')
print -depsc f1ppf2ppplot.eps

%% Sample functions with piecwise constant second derivatives
delta = 0.2;
B = 1./(2*delta.^2);
c = -0.2;
f3 = @(x) B*(4*delta.^2 + (x-c).^2 + (x-c-delta).*abs(x-c-delta) ...
   - (x-c+delta).*abs(x-c+delta)).*(abs(x-c) <= 2*delta);
f3pp = @(x) 2*B*(1 + sign(x-c-delta) - sign(x-c+delta)) ...
   .*(abs(x-c) <= 2*delta);
figure
h = plot(xplot,f3(xplot),'-','color',MATLABPurple);
axis([-1 1 -0.2 1.2])
xlabel('\(x\)')
legend(h,{'\(f_3(x)\)'},'location', 'northeast','box','off')
print -depsc f3plot.eps

figure
h = plot(xplot,f3pp(xplot),'-','color',MATLABPurple);
%axis([-1 1 -0.2 1.2])
xlabel('\(x\)')
legend(h,{'\(f_3''''(x)\)'},'location', 'northeast','box','off')
print -depsc f3ppplot.eps

