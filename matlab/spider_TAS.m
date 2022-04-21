% spider chart for TAS Criteria
figure(1); clf
chart_title = "Autonomous System Trust Mapping";


% Initialize data points
D1 = [5 7.5 9 4 4]; 
D2 = [1 6 8 5 6 ];
min_criteria = [0,0,0,0,0; 3, 6.5, 9.5, 3.5, 6];
P = [D1; D2];
axis_labels = { 'Security',...
                'Transparency',...
                'Reliability',...
                'Appearance',...
                'Adaptability'};

% Spider plot
s = spider_plot_class(P);
s.AxesInterval = 5;
s.AxesPrecision = 0;
s.AxesDisplay='one';
s.AxesLimits = [0, 0, 0, 0, 0; 10, 10, 10, 10, 10];
s.FillOption = 'on';
s.FillTransparency = 0.0;
% s.Color = [139, 0, 0; 240, 128, 128]/255;
grey_rgb = 80;
s.Color = [grey_rgb, grey_rgb, grey_rgb; grey_rgb, grey_rgb, grey_rgb]/255;
s.AxesShaded = 'on';
s.AxesShadedLimits = min_criteria;
s.LineWidth = 1.5;
s.LineStyle = {'-'; '--'};
s.Marker = 'none';
s.AxesFontSize = 11;
s.LabelFontSize = 10;
s.AxesColor = [0.8, 0.8, 0.8];
s.AxesLabelsEdge = 'none';
s.AxesLabels = axis_labels;
s.AxesRadial = 'on';

% Title and legend settings
title(sprintf(chart_title),...
    'FontSize', 14);
s.LegendLabels = {'AS-Trustworthiness', 'User Trust'};
s.LegendHandle.Location = 'south';

% export_fig('trust_spider', '-png', '-r300'); %'-transparent',
ax = gca;
exportgraphics(ax,'trust_spider.png', ...
    'ContentType','vector','Resolution',300)