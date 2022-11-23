xx = 0:0.1:10;
yy = gaussmf(xx, [1,2])
plot(xx,yy)
xlabel('gaussmf, P=[2 5]')
ylabel('Membership')
ylim([-0.05 1.05])