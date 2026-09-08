clear; close all; clc;

%% Parameters
x0_values = [-3, -1.5, -0.5, 0.5, 1.5, 3];
t = linspace(0,10,1000);

%% Create figure
figure('Position',[100 100 1100 400]);

%% ------------------------------------------------------------
%% Left: vector field f(x) = -x^3
%% ------------------------------------------------------------

subplot(1,2,1)

x = linspace(-2,2,500);
f = -x.^3;

plot(x,f,'LineWidth',2);
hold on;
grid on;

yline(0,'k-');
xline(0,'k-');

xlabel('$x$','Interpreter','latex');
ylabel('$\dot{x}$','Interpreter','latex');

title('Vector field: $\dot{x}=-x^3$', ...
    'Interpreter','latex');

% Add arrows indicating direction of motion
x_arrows = [-1.7 -1.2 -0.7 -0.3 0.3 0.7 1.2 1.7];

for i = 1:length(x_arrows)

    x0 = x_arrows(i);

    % Direction of motion
    direction = sign(-x0^3);

    quiver(x0,0,...
           0.25*direction,0,...
           0,...
           'LineWidth',1.5,...
           'MaxHeadSize',0.8);

end

plot(0,0,'ko','MarkerFaceColor','k');

text(0.1,1.2,...
    'Equilibrium',...
    'Interpreter','latex');

%% ------------------------------------------------------------
%% Right: trajectories x(t)
%% ------------------------------------------------------------

subplot(1,2,2)

hold on;
grid on;

for i = 1:length(x0_values)

    x0 = x0_values(i);

    % Exact solution
    x_t = x0 ./ sqrt(1 + 2*x0^2*t);

    plot(t,x_t,'LineWidth',2);

end

yline(0,'k-');

xlabel('$t$','Interpreter','latex');
ylabel('$x(t)$','Interpreter','latex');

title('Trajectories converge to the origin', ...
    'Interpreter','latex');

legend('$x_0=-3$', ...
       '$x_0=-1.5$', ...
       '$x_0=-0.5$', ...
       '$x_0=0.5$', ...
       '$x_0=1.5$', ...
       '$x_0=3$', ...
       'Interpreter','latex',...
       'Location','eastoutside');