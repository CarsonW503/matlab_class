%Week 6 attempt:
%Carson Williams

y_data = [0.073, 0.44, 0.81, 1.19, 1.56, 1.93, 2.3, 2.67, 3.04];
u_data = [57.12, 75.78, 83.77, 89.58, 94.16, 97.99, 100.81, 102.13, 102.62];

%plot(u_data, y_data)

%Setting variables n what not
%e = exp(1);
u_star = [0:10];
k = 0.4;     %m/s
v = 0.01;    %cm^2/s

%ustar is the fit? whatever that means
%smooth_log = @(u_data,y_data,u_star) (log(y_data.*u_star/v)/k)-(u_data./u_star)
%temp = '(log(y_data.*u_star/v)/k)-(u_data./u_star)';
% smooth_log = @(u_data,y_data,u_star) (u_star.*log(y_data.*u_star./v))/(u_data.*k);
% temp = '(u_star.*log(y_data.*u_star./v))/(u_data.*k)';
smooth_log = @(u_star, k, v, y_data) ((u_star./k).*(log((y_data.*u_star)./v)))
temp = '((u_star./k).*(log((y_data.*u_star)./v)))'

figure('name', 'Smooth Log');
plot(u_data, y_data, '.')
hold on

fittype_smooth = fittype(temp, 'independent', 'y_data', 'dependent', 'u');   %y independant u dpendant
fit_smooth = fit(u_data',y_data',fittype_smooth, 'StartPoint', [1,1,1]);
plot(fit_smooth);

%Not correct
% p = polyfit(u_data,y_data,3);
% yEst = polyval(p,u_data);
% plot(u_data,yEst)

% p = polyfit(u_data,y_data,2);
% yEst = polyval(p,u_star);
% plot(u_star,yEst)

%y*ustar = v*e^((k*u)/ustar);
%yustar = fittype(v*e^((k*u)/ustar), 'independant', 'ustar', 'dependant', 'u');

