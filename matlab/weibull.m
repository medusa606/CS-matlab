%% Weibull to predict failure rate

% https://www.zvei.org/fileadmin/user_upload/Presse_und_Medien/
% Publikationen/2006/Dezember/Robustness_Validation/Implementation/
% 2012-11_How-to-measure-Lifetime-for-RV-Step-by-Step_Rev19c.pdf

% Capture a data stream (ds) fo failure events for each robot
ds = [[0,0,0,0,1],[0,0,0,1,0]]; %time interval is fixed, e.g mins

% complication - we have multiple 'life-times' per episode, can have
% collision event but this does not end the episode TODO

