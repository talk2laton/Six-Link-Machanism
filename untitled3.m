close all;

clrs = [51,200,255;0,0,255;0,204,204;255,183,234;204,102,0;206,179,140]/255;
L = [3,5,7,9,11];
X = [-1,-1,1,1]; Y = [-1,1,1,-1];
figure(Color='w',Position =  [20 70 1220 500]); hold on;
t = linspace(0,2*pi,7);
fill(1.15*cos(t), 1.15*sin(t), 0.8*[1,1,1], linewidth=1.5); hold on;
t = linspace(0, 2*pi, 101);
fill(cos(t), sin(t), 0.6*[1,1,1]); hold on;

axis([-1,11,-5,5])
axis equal off; 
image = getframe(gcf);
img = image.cdata;
[img, alpha] = RemoveWhiteBkgrd(img);
imwrite(img, "B_"+k+".png", Alpha=alpha);


function [img, alpha] = RemoveWhiteBkgrd(img)
    sz = size(img);
    alpha = zeros(sz(1:2));
    imin = sz(1); imax = 0;
    jmin = sz(2); jmax = 0;
    for i = 1:sz(1)
        for j = 1:sz(2)
            if any(img(i,j,:)~=255)
                alpha(i,j) = 1;
                imin = min(imin, i);
                jmin = min(jmin, j);
                imax = max(imax, i);
                jmax = max(jmax, j);
            end
        end
    end
    img = img(imin:imax, jmin:jmax,:);
    alpha = alpha(imin:imax, jmin:jmax);
end

function Bar = BarMaker(L, clr, textstring, F)
    t1 = pi/2 + linspace(0, pi, 101); t2 = t1+pi;
    Xl = [0.5*cos(t1), L + 0.5*cos(t2)];
    Yl = [0.5*sin(t1), 0.5*sin(t2)];
    X = Xl; Y = Yl;
    Xl = [Xl,Xl(1)]; Yl = [Yl,Yl(1)]; 
    if(nargin == 4)
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
    Bar.edge = plot(Xl, Yl, 'k', LineWidth=3); 
    Bar.fill = fill(X, Y, clr, 'EdgeColor','none'); 
    Bar.text = text(0.5*L, 0, "$" +  textstring + "$", 'Interpreter', 'Latex', ...
        'HorizontalAlignment','center','VerticalAlignment','middle',...
        'FontSize', 15); 
    Bar.Rotate = @(theta) set(Hg,'Matrix', makehgtform('zrotate',theta));
end

function Bar = BarMaker2(L, clr, textstring, F)
    t1 = pi/2 + linspace(0, pi, 101); t2 = t1+pi; 
    Xl = [0.5*cos(t1), L + 0.5*cos(t2(1)), L + cos(t2), L + 0.5*cos(t2(end))];
    Yl = [0.5*sin(t1), 0.5*sin(t2(1)),     sin(t2),     0.5*sin(t2(end))];
    X = Xl; Y = Yl;
    Xl = [Xl,Xl(1)]; Yl = [Yl,Yl(1)]; 
    if(nargin == 4)
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
    Bar.edge = plot(Xl, Yl, 'k', LineWidth=3); 
    Bar.fill = fill(X, Y, clr, 'EdgeColor','none'); 
    Bar.text = text(0.5*L, 0, "$" +  textstring + "$", 'Interpreter', 'Latex', ...
        'HorizontalAlignment','center','VerticalAlignment','middle',...
        'FontSize', 15);
   
end
