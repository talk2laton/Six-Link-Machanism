close all;
L1 = 5; L2 = 2; L3 = 6; L4 = 4; L5 = 6; L6 = 4; L7 = 5; L8 = 1;
clrs = [0,0,0;51,200,255;0,0,255;0,204,204;255,183,234;204,102,0]/255;
t = linspace(0,2*pi,7); brown = [206,179,140]/255;
figure(Color='w',Position =  [20 70 1220 500]);
%subplot(3,2,[1,3,5]);
fill(1.15*cos(t), 1.15*sin(t), 0.7*[1,1,1]); hold on;
fill(L1+1.15*cos(t), 1.15*sin(t), 0.7*[1,1,1]); 
fill((L1 + L7)+1.15*cos(t), L8+1.15*sin(t), 0.7*[1,1,1]);
xline(0); yline(0); axis equal
t4 = acos(((L2+L3)^2 - L1^2 - L4^2)/(2*L1*L4));
t2 = asin(sin(t4*L4/(L2+L3)));
t3 = atan2(L4*sin(t4) - L2*sin(t2), L1 + L4*cos(t4)-L2*cos(t2));
theta2 = t2 + linspace(0,2*pi,101);
theta4 = t4 + 0*theta2; theta3 = t3 + 0*theta2;
x5 = L2*cos(t2) + (2/3)*((L1 + L4*cos(t4)) - L2*cos(t2));
y5 = L2*sin(t2) + (2/3)*(L4*sin(t4) - L2*sin(t2));
f = @(T) [x5+L5*cos(T(1))-(L1+L7+0.9*L6*cos(T(2)))
          y5+L5*sin(T(1))-(L8+0.9*L6*sin(T(2)))];
t56 = fsolve(f, [1.5*pi; 1.5*pi]);
theta5 = t56(1) + 0*theta2;
theta6 = t56(2) + 0*theta2;
for i = 2:101
    t2 = theta2(i); t4 = theta4(i); t5 = theta5(i); t6 = theta6(i);
    f = @(t) (L2*cos(t2)-(L1 + L4*cos(t)))^2 + (L2*sin(t2)-L4*sin(t))^2 - L3^2;
    t4 = fzero(f, t4); theta4(i) = t4;
    t3 = atan2(L4*sin(t4) - L2*sin(t2), L1 + L4*cos(t4)-L2*cos(t2));
    theta3(i) = t3;
    x5 = L2*cos(t2) + (2/3)*((L1 + L4*cos(t4)) - L2*cos(t2));
    y5 = L2*sin(t2) + (2/3)*(L4*sin(t4) - L2*sin(t2));
    f = @(T) [x5+L5*cos(T(1))-(L1+L7+0.9*L6*cos(T(2)))
              y5+L5*sin(T(1))-(L8+0.9*L6*sin(T(2)))];
    t56 = fsolve(f, [t5; t6]); t5 = t56(1); t6 = t56(2);
    theta5(i) = t5; theta6(i) = t6;
end
t2 = theta2(1); t3 = theta3(1); t4 = theta4(1); t5 = theta5(1); t6 = theta6(1);
ax = gca;
Hg2 = hgtransform('Parent',ax); 
Bar2 = BarMaker(L2, clrs(2,:), Hg2, '$\theta_2$', 0); Bar2.Rotate(t2);
Hg_4 = hgtransform('Parent',ax); Hg4 = hgtransform('Parent',Hg_4); 
set(Hg_4,'Matrix', makehgtform('translate',[L1, 0, 0]));
Bar4 = BarMaker(L4, clrs(4,:), Hg4, '$\theta_4$', 0);  Bar4.Rotate(t4);
Hg_3 = hgtransform('Parent',ax); Hg3 = hgtransform('Parent',Hg_3); 
x3 = L2*cos(t2); y3 = L2*sin(t2);
set(Hg_3,'Matrix', makehgtform('translate',[x3, y3, 0]));
Bar3 = BarMaker(L3, clrs(3,:), Hg3, '$\theta_3$', [0,0.45,1]); Bar3.Rotate(t3);
x5 = L2*cos(t2) + (2/3)*((L1 + L4*cos(t4)) - L2*cos(t2));
y5 = L2*sin(t2) + (2/3)*(L4*sin(t4) - L2*sin(t2));
Hg_6 = hgtransform('Parent',ax); Hg6 = hgtransform('Parent',Hg_6); 
set(Hg_6,'Matrix', makehgtform('translate',[L1 + L7, L8, 0]));
Bar6 = BarMaker2(L6, clrs(6,:), Hg6, '$\theta_6$', 0); Bar6.Rotate(t6);
tx6 = L1 + L7 + 1.3*L6*cos(t6); ty6 = L8 + 1.3*L6*sin(t6);
Hg_5 = hgtransform('Parent',ax); Hg5 = hgtransform('Parent',Hg_5); 
set(Hg_5,'Matrix', makehgtform('translate',[x5, y5, 0]));
Bar5 = BarMaker(L5, clrs(5,:), Hg5, '$\theta_5$', [0,0.3,1]); Bar5.Rotate(t5);
text(0.2, 4.5, '$y$', 'Interpreter', 'Latex', 'FontSize', 15);
text(12.5, -0.2, '$x$', 'Interpreter', 'Latex', 'FontSize', 15);
axis([-2.6,13,-5,5]); axis off; box off;
w2 = 30*2*pi/60; dt = 2*pi/100/w2;
%subplot(3,2,2)
% Bar2Ang = plot(0, nan, Color = clrs(2,:), LineWidth = 2); hold on;
% Bar3Ang = plot(0, nan, Color = clrs(3,:), LineWidth = 2); 
% Bar4Ang = plot(0, nan, Color = clrs(4,:), LineWidth = 2);
% Bar5Ang = plot(0, nan, Color = clrs(5,:), LineWidth = 2); 
% Bar6Ang = plot(0, nan, Color = clrs(6,:), LineWidth = 2);hold off;
% ax = gca; ax.TickLabelInterpreter = 'latex'; ax.FontSize = 15;
% xlabel('$time (sec)$', 'Interpreter', 'Latex', 'FontSize', 15);
% ylabel('$\theta (rad)$', 'Interpreter', 'Latex', 'FontSize', 15);
% legend('$\theta_2$', '$\theta_3$', '$\theta_4$', '$\theta_5$', ....
%  '$\theta_6$', 'Interpreter', 'Latex', 'FontSize', 15, ...
%  'Location','northeastoutside');
% axis([0,10,0,7]); grid on
% subplot(3,2,4)
% Bar2Vel = plot(0, nan, Color = clrs(2,:), LineWidth = 2); hold on;
% Bar3Vel = plot(0, nan, Color = clrs(3,:), LineWidth = 2); 
% Bar4Vel = plot(0, nan, Color = clrs(4,:), LineWidth = 2);
% Bar5Vel = plot(0, nan, Color = clrs(5,:), LineWidth = 2); 
% Bar6Vel = plot(0, nan, Color = clrs(6,:), LineWidth = 2);hold off;
% ax = gca; ax.TickLabelInterpreter = 'latex'; ax.FontSize = 15;
% xlabel('$time (sec)$', 'Interpreter', 'Latex', 'FontSize', 15);
% ylabel('$\omega (rad/s)$', 'Interpreter', 'Latex', 'FontSize', 15);
% legend('$\omega_2$', '$\omega_3$', '$\omega_4$', '$\omega_5$', ....
%  '$\omega_6$', 'Interpreter', 'Latex', 'FontSize', 15, ...
%   'Location','northeastoutside');
% axis([0,10,-4,4]); grid on
% subplot(3,2,6)
% Bar2Acc = plot(0, nan, Color = clrs(2,:), LineWidth = 2); hold on;
% Bar3Acc = plot(0, nan, Color = clrs(3,:), LineWidth = 2); 
% Bar4Acc = plot(0, nan, Color = clrs(4,:), LineWidth = 2);
% Bar5Acc = plot(0, nan, Color = clrs(5,:), LineWidth = 2); 
% Bar6Acc = plot(0, nan, Color = clrs(6,:), LineWidth = 2); hold off;
% ax = gca; ax.TickLabelInterpreter = 'latex'; ax.FontSize = 15;
% xlabel('$time (sec)$', 'Interpreter', 'Latex', 'FontSize', 15);
% ylabel('$\alpha (rad/s^2)$', 'Interpreter', 'Latex', 'FontSize', 15);
% legend('$\alpha_2$', '$\alpha_3$', '$\alpha_4$', '$\alpha_5$', ....
%  '$\alpha_6$', 'Interpreter', 'Latex', 'FontSize', 15, ...
%  'Location','northeastoutside');
% axis([0,10,-30,30]); grid on
t = 0;
vid = VideoWriter('six2 link.avi');
open(vid); frame = getframe(gcf);  writeVideo(vid,frame);
for i = 2:500
    t = t + dt;
    j = mod(i-1, 101)+1; jm1 = mod(i-2, 101)+1; jp1 = mod(i, 101)+1;
    t2 = theta2(j); Bar2.Rotate(t2); 
    t3 = theta3(j); Bar3.Rotate(t3); x3 = L2*cos(t2); y3 = L2*sin(t2);
    set(Hg_3,'Matrix', makehgtform('translate',[x3, y3, 0]));
    t4 = theta4(j); Bar4.Rotate(t4); 
    t5 = theta5(j); Bar5.Rotate(t5); 
    x5 = L2*cos(t2) + (2/3)*((L1 + L4*cos(t4)) - L2*cos(t2));
    y5 = L2*sin(t2) + (2/3)*(L4*sin(t4) - L2*sin(t2));
    set(Hg_5,'Matrix', makehgtform('translate',[x5, y5, 0]));
    t6 = theta6(j); Bar6.Rotate(t6); 
    estimator(Bar2Ang, Bar2Vel, Bar2Acc, theta2, jm1, j, jp1, dt);
    estimator(Bar3Ang, Bar3Vel, Bar3Acc, theta3, jm1, j, jp1, dt);
    estimator(Bar4Ang, Bar4Vel, Bar4Acc, theta4, jm1, j, jp1, dt);
    estimator(Bar5Ang, Bar5Vel, Bar5Acc, theta5, jm1, j, jp1, dt);
    estimator(Bar6Ang, Bar6Vel, Bar6Acc, theta6, jm1, j, jp1, dt);
    drawnow; frame = getframe(gcf);  writeVideo(vid,frame);
end
close(vid);

function estimator(Ang, Vel, Acc, theta, jm1, j, jp1, dt)
    ang = theta(j); 
    vel = 0.5/dt*(theta(jp1) - theta(jm1));
    acc = (theta(jp1) - 2*theta(j) + theta(jm1))/dt^2;
    Ang.XData = dt + Ang.XData;
    Vel.XData = dt + Vel.XData; 
    Acc.XData = dt + Acc.XData; 
    Ang.YData = [ang, Ang.YData]; Ang.XData = [0, Ang.XData];
    if(abs(vel)<100)
        Vel.YData = [vel, Vel.YData]; Vel.XData = [0, Vel.XData];
    end
    if(abs(acc)<30)
        Acc.YData = [acc, Acc.YData]; Acc.XData = [0, Acc.XData];
    end
end

function Bar = BarMaker(L, clr, Hg, textstring, F)
    t1 = pi/2 + linspace(0, pi, 21); t2 = t1+pi;
    Xl = [0.5*cos(t1), L + 0.5*cos(t2)];
    Yl = [0.5*sin(t1), 0.5*sin(t2)];
    X = Xl; Y = Yl;
    Xl = [Xl,Xl(1)]; Yl = [Yl,Yl(1)]; 
    if(nargin == 5)
        t = flip([t1, t2]);
        F = sort(F, 'descend');
        for n = 1:numel(F)
            f = F(n);
            X = [X, f*L, f*L + 0.3*cos(t), f*L];
            Y = [Y, 0.5, 0.3*sin(t), 0.5];
            Xl = [Xl, nan, f*L + 0.3*cos(t)];
            Yl = [Yl, nan, 0.3*sin(t)];
        end
    end
    Bar.line = plot([0,1.5*L], [0, 0], 'k'); set(Bar.line,'Parent', Hg);
    Bar.edge = plot(Xl, Yl, 'k'); set(Bar.edge,'Parent', Hg);
    Bar.fill = fill(X, Y, clr, 'EdgeColor','none'); set(Bar.fill,'Parent', Hg); 
    Bar.text = text(1.5*L, 0, textstring, 'Interpreter', 'Latex', ...
        'HorizontalAlignment','center','VerticalAlignment','middle',...
        'FontSize', 15); set(Bar.text,'Parent', Hg);
    Bar.Rotate = @(theta) set(Hg,'Matrix', makehgtform('zrotate',theta));
end

function Bar = BarMaker2(L, clr, Hg, textstring, F)
    t1 = pi/2 + linspace(0, pi, 21); t2 = t1+pi; 
    Xl = [0.5*cos(t1), L + 0.5*cos(t2(1)), L + cos(t2), L + 0.5*cos(t2(end))];
    Yl = [0.5*sin(t1), 0.5*sin(t2(1)),     sin(t2),     0.5*sin(t2(end))];
    X = Xl; Y = Yl;
    Xl = [Xl,Xl(1)]; Yl = [Yl,Yl(1)]; 
    if(nargin == 5)
        t = flip([t1, t2]);
        F = sort(F, 'descend');
        for n = 1:numel(F)
            f = F(n);
            X = [X, f*L, f*L + 0.3*cos(t), f*L];
            Y = [Y, 0.5, 0.3*sin(t), 0.5];
            Xl = [Xl, nan, f*L + 0.3*cos(t)];
            Yl = [Yl, nan, 0.3*sin(t)];
        end
    end
    Bar.line = plot([0,1.5*L], [0, 0], 'k'); set(Bar.line,'Parent', Hg);
    Bar.edge = plot(Xl, Yl, 'k'); set(Bar.edge,'Parent', Hg);
    Bar.fill = fill(X, Y, clr, 'EdgeColor','none'); set(Bar.fill,'Parent', Hg); 
    Bar.text = text(1.5*L, 0, textstring, 'Interpreter', 'Latex', ...
        'HorizontalAlignment','center','VerticalAlignment','middle',...
        'FontSize', 15); set(Bar.text,'Parent', Hg);
    Bar.Rotate = @(theta) set(Hg,'Matrix', makehgtform('zrotate',theta));
end