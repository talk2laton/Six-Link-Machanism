Y0 = [349, 1, 0]; N = 350;
beta = 40; gamma = 10;
dydt = @(t,y) [-beta*y(1)*y(2)/N; beta*y(1)*y(2)/N - gamma*y(2); gamma*y(2)];
[T, Y] = ode45(dydt, linspace(0,1,365), Y0);
Y = round(Y + 0.1*Y.*rand(size(Y)));
plot(T, Y)
