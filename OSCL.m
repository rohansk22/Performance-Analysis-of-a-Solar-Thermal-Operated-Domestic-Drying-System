function [fitresult, gof] = createFit7(x, y)
%CREATEFIT7(X,Y)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Output: y
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 17-Mar-2019 15:25:35


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x, y );

% Set up fittype and options.
ft = fittype( 'a*exp(-b*x^n)+b*exp(-g*x)+c*exp(-h*t)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.627344134052291 0.41947451947792 0.382332333662675 0.392227019534168 0.655477890177557 0.678735154857773 0.171186687811562];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'Moisture Ratio Vs Time', 'Henderson and Pabis', 'Location', 'NorthEast' );
% Label axes
xlabel Time
ylabel MR
xlim([8,17])
grid on


