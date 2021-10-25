%% Weibull to predict failure rate

% https://www.zvei.org/fileadmin/user_upload/Presse_und_Medien/
% Publikationen/2006/Dezember/Robustness_Validation/Implementation/
% 2012-11_How-to-measure-Lifetime-for-RV-Step-by-Step_Rev19c.pdf

% Number of robots
n = 10;

% Capture a data stream (ds) fo failure events for each robot
ds1 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1];
ds2 = [0,0,0,0,0,0,0,0,0,0,0,0,0,1]; %time interval is fixed, e.g mins

% we must also know the total robot-hours or minutes, eg.
robot_time = length(ds1) + length(ds2);

% complication - we have multiple 'life-times' per episode, can have
% collision event but this does not end the episode TODO

% consider what are the filure modes

% For each robot get the time-to-failure (TTF) distribution
% ttf = [5,6,4,5,6,5,4,8,9,2,5,4,3,8,7]; %e.g.
ttf = [0.3,0.35,0.38,0.45,0.52,0.58,0.6,0.69,0.69,0.72,0.75,0.8,0.9,1.15,1.2];

% sort the ttf by value
ttf_sort = sort(ttf);

%% plot TTF
figure(1); clf
plot(ttf_sort)
xlabel('Event Number')
ylabel('Time-To-Failure (min)')

%% TTF-distribution, CDF (cumulative distribution function)
% Normalise to the total number of observed failures

cdf = linspace(1/length(ttf),100,length(ttf));
x_linear = linspace(min(ttf),max(ttf),10);
figure(2); clf;
plot(ttf_sort,cdf,'o-b')
xlabel('Failure Time (min)')
ylabel('CDF (%)')
legend('initial s/w version 1.0','Location','best')

%% Ideally the graph is populated with updates to the DUT
% providing improved time to failure
% ttf_v2 = [7,8,6,6,7,9,9,8,9,7,7,6,7,9,7]; %e.g.
ttf_v2 = ttf +rand(1,length(ttf));
ttf_v2_sort = sort(ttf_v2);
cdf_v2 = linspace(1/length(ttf_v2),100,length(ttf_v2));
figure(2); hold on;
plot(ttf_v2_sort,cdf_v2,'o-r')
legend('initial s/w version 1.0','updated s/w version 1.1', ...
    'Location','best')

% % %% Analyse improvement
% plot([2,9],[50,50],':k')
% plot([5,5],[0,50],':b')
% plot([7,7],[0,50],':r')
% legend('initial s/w version 1.0', ...
%     'updated s/w version 1.1','50% failure Rate', ...
%     'Location','best')

%% plot linear extrapolation of CDF
p=polyfit(ttf_sort,cdf,1);
ttf_linear = polyval(p,x_linear);
% ttf_linear = polyval(p,x2);
plot(x_linear,ttf_linear)
ylim([0,100])

%% Add confidence bounds
% choose the confidence interval sigma=standard deviation, z=z-score
% 84.1% (sigma/z=1), 90% (1.645), 95% (1.96), 97.7% (2), 99.9 (3)
sigma_lev=[1,1.64,1.96,2,3];
ci_levs=[84.1,90,95,97.7,99.9];

% choose the CI level you want
chosen_ci = 2;

% find the degrees of freedom and alpha
ci=ci_levs(chosen_ci)/100;
dof = length(ttf) - 1;
alpha = (1-ci)/2;

% look up the T-table TODO fied but could code dynamic
T_table = [1.337,1.746,2.120,2.583,4.015]; 

% mean +/- ts/(sqrt(n)
% s = standard deviation
std_ttf = std(ttf_sort);
ttf_mean = mean(ttf);
interval = (T_table(chosen_ci) * std_ttf / sqrt(dof+1));

% add CI to the plot
ttf_mean_ci_upper = ttf_linear + interval;
ttf_mean_ci_lower = ttf_linear - interval;

plot(x_linear,ttf_mean_ci_upper,'--k')
plot(x_linear,ttf_mean_ci_lower,'--k')

% set(gca, 'YScale', 'log')
% set(gca, 'XScale', 'log')

legend('initial s/w version 1.0', ...
    'updated s/w version 1.1',...
    'TTF linear mean',...
    sprintf('%.1f%% confidence', ci_levs(chosen_ci)),...
    '',...
    'Location','best')


%% Spider plot for pertinent failure modes, F1, F2,...Fn
% Plot for S/Wv1.0
% Plot for S/Wv1.1

%% Catastophic events?
% Simulate human


