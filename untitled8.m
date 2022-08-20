close all;
L1 = 5; L2 = 2; L3 = 6; L4 = 4; L5 = 6; L6 = 4; L7 = 5; L8 = 1;
t = linspace(0,2*pi,7); brown = [206,179,140]/255;
subplot(3,2,[1,3,5]);
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
Bar2 = BarMaker(L2, 'g', Hg2, 0); Bar2.Rotate(t2);
Hg_4 = hgtransform('Parent',ax); Hg4 = hgtransform('Parent',Hg_4); 
set(Hg_4,'Matrix', makehgtform('translate',[L1, 0, 0]));
Bar4 = BarMaker(L4, 'g', Hg4, 0);  Bar4.Rotate(t4);
Hg_3 = hgtransform('Parent',ax); Hg3 = hgtransform('Parent',Hg_3); 
x3 = L2*cos(t2); y3 = L2*sin(t2);
set(Hg_3,'Matrix', makehgtform('translate',[x3, y3, 0]));
Bar3 = BarMaker(L3, 'b', Hg3, [0,0.45]); Bar3.Rotate(t3);
x5 = L2*cos(t2) + (2/3)*((L1 + L4*cos(t4)) - L2*cos(t2));
y5 = L2*sin(t2) + (2/3)*(L4*sin(t4) - L2*sin(t2));
Hg_6 = hgtransform('Parent',ax); Hg6 = hgtransform('Parent',Hg_6); 
set(Hg_6,'Matrix', makehgtform('translate',[L1 + L7, L8, 0]));
Bar6 = BarMaker2(L6, 'r', Hg6, 0); Bar6.Rotate(t6);
Hg_5 = hgtransform('Parent',ax); Hg5 = hgtransform('Parent',Hg_5); 
set(Hg_5,'Matrix', makehgtform('translate',[x5, y5, 0]));
Bar5 = BarMaker(L5, brown, Hg5, 0.3); Bar5.Rotate(t5);
axis([-2.6,11.4,-5,5])
w2 = 30*2*pi/60; dt = 2*pi/100/w2;
subplot(3,2,2)
Bar2Ang = plot(0, nan, LineWidth=2); hold on;
Bar3Ang = plot(0, nan, LineWidth=2); Bar4Ang = plot(0, nan, LineWidth=2);
Bar5Ang = plot(0, nan, LineWidth=2); Bar6Ang = plot(0, nan, LineWidth=2);
%legend('Angle2', 'Angle3', 'Angle4', 'Angle5', 'Angle6', 'Location','northeastoutside');
axis([0,10,0,7])
subplot(3,2,4)
Bar2Vel = plot(0, nan, LineWidth=2); hold on;
Bar3Vel = plot(0, nan, LineWidth=2); Bar4Vel = plot(0, nan, LineWidth=2);
Bar5Vel = plot(0, nan, LineWidth=2); Bar6Vel = plot(0, nan, LineWidth=2);
%legend('Omega2', 'Omega3', 'Omega4', 'Omega5', 'Omega6', 'Location','northeastoutside');
axis([0,10,-4,4])
subplot(3,2,6)
Bar2Acc = plot(0, nan, LineWidth=2); hold on;
Bar3Acc = plot(0, nan, LineWidth=2); Bar4Acc = plot(0, nan, LineWidth=2);
Bar5Acc = plot(0, nan, LineWidth=2); Bar6Acc = plot(0, nan, LineWidth=2);
%legend('Alpha2', 'Alpha3', 'Alpha4', 'Alpha5', 'Alpha6', 'Location','northeastoutside');
axis([0,10,-30,30])
t = 0;
for i = 2:10000
    t = t + dt;
    j = mod(i-1, 101)+1; jm1 = mod(i-2, 101)+1; jp1 = mod(i, 101)+1;
    t2 = theta2(j); t3 = theta3(j); t4 = theta4(j); t5 = theta5(j); 
    t6 = theta6(j); Bar2.Rotate(t2);  Bar4.Rotate(t4);
    x3 = L2*cos(t2); y3 = L2*sin(t2);
    set(Hg_3,'Matrix', makehgtform('translate',[x3, y3, 0]));
    Bar3.Rotate(t3);
    x5 = L2*cos(t2) + (2/3)*((L1 + L4*cos(t4)) - L2*cos(t2));
    y5 = L2*sin(t2) + (2/3)*(L4*sin(t4) - L2*sin(t2));
    set(Hg_5,'Matrix', makehgtform('translate',[x5, y5, 0]));
    Bar5.Rotate(t5); Bar6.Rotate(t6);
    estimator(Bar2Ang, Bar2Vel, Bar2Acc, theta2, jm1, j, jp1, dt, t);
    estimator(Bar3Ang, Bar3Vel, Bar3Acc, theta3, jm1, j, jp1, dt, t);
    estimator(Bar4Ang, Bar4Vel, Bar4Acc, theta4, jm1, j, jp1, dt, t);
    estimator(Bar5Ang, Bar5Vel, Bar5Acc, theta5, jm1, j, jp1, dt, t);
    estimator(Bar6Ang, Bar6Vel, Bar6Acc, theta6, jm1, j, jp1, dt, t);
    drawnow
end

function estimator(Ang, Vel, Acc, theta, jm1, j, jp1, dt, t)
    ang = theta(j); 
    vel = 0.5/dt*(theta(jp1) - theta(jm1));
    acc = (theta(jp1) - 2*theta(j) + theta(jm1))/dt^2;
    Ang.XData = dt + Ang.XData;
    Vel.XData = dt + Vel.XData; 
    Acc.XData = dt + Acc.XData; 
    Ang.YData = [ang, Ang.YData]; Ang.XData = [0, Ang.XData];
    Vel.YData = [vel, Vel.YData]; Vel.XData = [0, Vel.XData];
    Acc.YData = [acc, Acc.YData]; Acc.XData = [0, Acc.XData];
end

function Bar = BarMaker(L, clr, Hg, F)
    t1 = pi/2 + linspace(0, pi, 21); t2 = t1+pi; 
    Xl = [0.5*cos(t1), L + 0.5*cos(t2)];
    Yl = [0.5*sin(t1), 0.5*sin(t2)];
    X = Xl; Y = Yl;
    Xl = [Xl,Xl(1)]; Yl = [Yl,Yl(1)]; 
    if(nargin == 4)
        for n = 1:numel(F)
            f = F(n);
            X = [X, f*L, f*L + 0.3*cos([t1,t2]), f*L];
            Y = [Y, 0.5, 0.3*sin([t1,t2]), 0.5];
            Xl = [Xl, nan, f*L + 0.3*cos([t1,t2])];
            Yl = [Yl, nan, 0.3*sin([t1,t2])];
        end
    end
    Bar.line = plot(Xl, Yl, 'k');
    Bar.fill = fill(X, Y, clr, 'EdgeColor','none');
    set(Bar.fill,'Parent', Hg); set(Bar.line,'Parent', Hg);
    Bar.Rotate = @(theta) set(Hg,'Matrix', makehgtform('zrotate',theta));
end

function Bar = BarMaker2(L, clr, Hg, F)
    t1 = pi/2 + linspace(0, pi, 21); t2 = t1+pi; 
    Xl = [0.5*cos(t1), L + 0.5*cos(t2(1)), L + cos(t2), L + 0.5*cos(t2(end))];
    Yl = [0.5*sin(t1), 0.5*sin(t2(1)),     sin(t2),     0.5*sin(t2(end))];
    X = Xl; Y = Yl;
    Xl = [Xl,Xl(1)]; Yl = [Yl,Yl(1)]; 
    if(nargin == 4)
        for n = 1:numel(F)
            f = F(n);
            X = [X, f*L, f*L + 0.3*cos([t1,t2]), f*L];
            Y = [Y, 0.5, 0.3*sin([t1,t2]), 0.5];
            Xl = [Xl, nan, f*L + 0.3*cos([t1,t2])];
            Yl = [Yl, nan, 0.3*sin([t1,t2])];
        end
    end
    Bar.line = plot(Xl, Yl, 'k');
    Bar.fill = fill(X, Y, clr, 'EdgeColor','none');
    set(Bar.fill,'Parent', Hg); set(Bar.line,'Parent', Hg);
    Bar.Rotate = @(theta) set(Hg,'Matrix', makehgtform('zrotate',theta));
end