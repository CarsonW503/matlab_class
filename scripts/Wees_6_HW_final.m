%Week 6 attempt:
%Carson Williams

y_data = [0.073, 0.44, 0.81, 1.19, 1.56, 1.93, 2.3, 2.67, 3.04];
u_data = [57.12, 75.78, 83.77, 89.58, 94.16, 97.99, 100.81, 102.13, 102.62];

%Setting variables n what not
u_star = [0:0.1:10];
k = 0.4;     %m/s
v = 0.01;    %cm^2/s

%data plot
figure('name', 'Smooth Log');
plot(u_data, y_data, '.');
hold on

smooth_log = @(C, y_data) ((C./k).*(log((y_data.*C)./v)));
u1 = nlinfit(y_data',u_data',smooth_log, 3);
plot(smooth_log(u1,u_star), u_star);

%%
rough_log = @(D, y_data) D(1)*(1/k)*log((y_data/D(2))+8.5*D(1));
u2 = nlinfit(y_data',u_data',rough_log, [3,0.01]);
plot(rough_log(u2,u_star), u_star);

title('Curve fit for smooth and rough logs for fluid flow');
xlabel('flow velocity (cm/s)');
ylabel('height (cm)');
legend('data', 'smooth log', 'rough log', "Location","northwest");
xlim([50,110]);
ylim([0,3.5]);

smooth_u = sprintf('%6.4f cm/s is the smooth log shear velocity \n', u1);
rough_u = sprintf('%6.4f cm/s is the rough log shear velocity \n', u2(1));
rough_ks = sprintf('%6.4f cm is the roughness heigh \n', u2(2));
disp(smooth_u)
disp(rough_u)
disp(rough_ks)