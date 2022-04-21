% line chart for TAS Criteria
figure(2); clf
chart_title = "Autonomous System Trust Mapping";


% Initialize data points
D1 = [5 7.5 9 4 4]; 
D2 = [1 6 8 5 6 ];
min_criteria = [3, 6.5, 9.5, 3.5, 6];
P = [D1; D2];
axis_labels = { 'Security',...
                'Transparency',...
                'Reliability',...
                'Appearance',...
                'Adaptability'};
plot(min_criteria)