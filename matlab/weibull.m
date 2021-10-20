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
ttf = [5,6,4,5,6,5,4,8,9,2,5,4,3,8,7]; %e.g.

% sort the ttf by value
ttf_sort = sort(ttf);

%% plot TTF
figure(1); clf
plot(ttf_sort)
xlabel('Event Number')
ylabel('Time-To-Failure (min)')

%% TTF-distribution, CDF or cumulative defect/failure function
% Normalise to the total number of observed failures

cdf = linspace(1/length(ttf),100,length(ttf));
figure(2); clf;
plot(ttf_sort,cdf)
xlabel('Failure Time (min)')
ylabel('CDF (%)')
legend('initial s/w version 1.0','Location','best')

%% Ideally the graph is populated with updates to the DUT
% providing improved time to failure
ttf_v2 = [7,8,6,6,7,9,9,8,9,7,7,6,7,9,7]; %e.g.
ttf_v2_sort = sort(ttf_v2);
cdf_v2 = linspace(1/length(ttf_v2),100,length(ttf_v2));
figure(2); hold on;
plot(ttf_v2_sort,cdf_v2)
legend('initial s/w version 1.0','updated s/w version 1.1', ...
    'Location','best')

%% Analyse improvement
plot([2,9],[50,50],':k')
plot([5,5],[0,50],':b')
plot([7,7],[0,50],':r')
legend('initial s/w version 1.0', ...
    'updated s/w version 1.1','50% failure Rate', ...
    'Location','best')


