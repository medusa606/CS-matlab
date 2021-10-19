figure(1); clf; hold on;
X = [35,58,76,35,58,76,35,58,76];
Y = [40,40,40,63,63,63,101,101,101];

Xs = [35,35,58,35,58,76]; Ys = [40,63,63,101,101,101]; %unsafe
Xp = [58,76]; Yp = [40,63]; %performance
Xh = 76; Yh = 40; %hesitant

p(1) = scatter(Xs,Ys,100,'xk', 'LineWidth', 1.9);
p(2) = scatter(Xp,Yp,100,'ok', 'LineWidth', 1.9);
p(3) = scatter(Xh,Yh,100,'ok', 'LineWidth', 1.9);
xlim([30 110])
ylim([30 110])
xlabel('Actual Distance Ahead (m)')
ylabel('Required Safe Distance Ahead (m)')

%% Safety Boundary
X2 = [20,110]; Y2 = [20,110];
p(4) = plot(X2, Y2,'--k'); 

%% Performance Boundary
TTC=2.5; %can have value 2-3seconds
velocity = 8.94; %equal to 20mph
win = TTC * velocity; % opportunity window

X2 = [20+win,110+win]; Y2 = [20,110];
p(5) = plot(X2, Y2,':k'); 

legend([p(1),p(2),p(4),p(5)], ...
    'SDA Assertion Failure', 'SDA Assertion Pass', ...
    'Safety Boundary', 'Performance Boundary')

%% use EXPORT_FIG
set(gcf, 'color', 'w')
set(gcf, 'color', 'none')
set(gca, 'color', 'w')
set(gca, 'color', 'none')
export_fig('SDA_trans', '-png', '-transparent', '-r300');

%% export with native
% set(gcf, 'color', 'none');   
% set(gca, 'color', 'none');
ax = gca;
exportgraphics(ax,'SDA.pdf','BackgroundColor','none', ...
    'ContentType','vector','Resolution',300)
