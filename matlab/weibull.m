%% Weibull to predict failure rate

% https://www.zvei.org/fileadmin/user_upload/Presse_und_Medien/
% Publikationen/2006/Dezember/Robustness_Validation/Implementation/
% 2012-11_How-to-measure-Lifetime-for-RV-Step-by-Step_Rev19c.pdf

% Number of robots
n = 10;

% Capture a data stream (ds) fo failure events for each robot
ds1 = [0,0,0,0,1];
ds2 = [0,0,0,0,0,1]; %time interval is fixed, e.g mins

% complication - we have multiple 'life-times' per episode, can have
% collision event but this does not end the episode TODO

% consider what are the filure modes

% For each robot get the time-to-failure (TTF) distribution
ttf = [5,6,4,5,6,5,4,8,9,2,5,4,3,8,7]; %e.g.

% sort the ttf by value
ttf_sort = sort(ttf);

% plot
figure(1); clf
plot(ttf_sort)
xlabel('Time Between Collision')
ylabel('Cumulative Failure Function')