clc;clear all;close all
%%
load Base_func_seg.mat
base_within16 = within_module16';
base_across16 = across_module16';
base_func_seg16 = functional_seg16';
a = base_within16';
b = base_across16';
stats=permutation_htest2_np([a,b],[ones(1,numel(a)) 2*ones(1,numel(b))],5000,0.05,'ttest');
base16_pval = min(stats.pvals);
base16_tval = stats.tvals;
%%

base_within25 = within_module25';
base_across25 = across_module25';
base_func_seg25 = functional_seg25';

a = base_within25';
b = base_across25';
stats=permutation_htest2_np([a,b],[ones(1,numel(a)) 2*ones(1,numel(b))],5000,0.05,'ttest');
base25_pval = min(stats.pvals);
base25_tval = stats.tvals;

base_within34 = within_module34';
base_across34 = across_module34';
base_func_seg34 = functional_seg34';

a = base_within34';
b = base_across34';
stats=permutation_htest2_np([a,b],[ones(1,numel(a)) 2*ones(1,numel(b))],5000,0.05,'ttest');
base34_pval = min(stats.pvals);
base34_tval = stats.tvals;
%%
load FRO_func_seg.mat
F_within16 = within_module16(:,2);
F_across16 = across_module16(:,2);
F_func_seg16 = functional_seg16(:,2);

a = F_within16';
b = F_across16';
stats=permutation_htest2_np([a,b],[ones(1,numel(a)) 2*ones(1,numel(b))],5000,0.05,'ttest');
F16_pval = min(stats.pvals);
F16_tval = stats.tvals;

F_within25 = within_module25(:,2);
F_across25 = across_module25(:,2);
F_func_seg25 = functional_seg25(:,2);

a = F_within25';
b = F_across25';
stats=permutation_htest2_np([a,b],[ones(1,numel(a)) 2*ones(1,numel(b))],5000,0.05,'ttest');
F25_pval = min(stats.pvals);
F25_tval = stats.tvals;

F_within34 = within_module34(:,2);
F_across34 = across_module34(:,2);
F_func_seg34 = functional_seg34(:,2);

a = F_within34';
b = F_across34';
stats=permutation_htest2_np([a,b],[ones(1,numel(a)) 2*ones(1,numel(b))],5000,0.05,'ttest');
F34_pval = min(stats.pvals);
F34_tval = stats.tvals;
%%
load OCC_func_seg.mat
O_within16 = within_module16(:,2);
O_across16 = across_module16(:,2);
O_func_seg16 = functional_seg16(:,2);

a = O_within16';
b = O_across16';
stats=permutation_htest2_np([a,b],[ones(1,numel(a)) 2*ones(1,numel(b))],5000,0.05,'ttest');
O16_pval = min(stats.pvals);
O16_tval = stats.tvals;

O_within25 = within_module25(:,2);
O_across25 = across_module25(:,2);
O_func_seg25 = functional_seg25(:,2);

a = O_within25';
b = O_across25';
stats=permutation_htest2_np([a,b],[ones(1,numel(a)) 2*ones(1,numel(b))],5000,0.05,'ttest');
O25_pval = min(stats.pvals);
O25_tval = stats.tvals;

O_within34 = within_module34(:,2);
O_across34 = across_module34(:,2);
O_func_seg34 = functional_seg34(:,2);

a = O_within34';
b = O_across34';
stats=permutation_htest2_np([a,b],[ones(1,numel(a)) 2*ones(1,numel(b))],5000,0.05,'ttest');
O34_pval = min(stats.pvals);
O34_tval = stats.tvals;
%% figure 7A right panel
figure(1)
    volp = violinplot([base_within16 base_across16 F_within16 F_across16 O_within16 O_across16]);
    set(gca, 'XTick', 1:6);
    set(gca,'FontName','Helvetica','FontSize',20);
    ylim([-0.3,0.3]);
    volp(1, 1).ViolinPlot.LineWidth = 0.5;
    volp(1, 2).ViolinPlot.LineWidth = 0.5;
    volp(1, 3).ViolinPlot.LineWidth = 0.5;
    volp(1, 4).ViolinPlot.LineWidth = 0.5;
    volp(1, 5).ViolinPlot.LineWidth = 0.5;
    volp(1, 6).ViolinPlot.LineWidth = 0.5;
    
    volp(1, 1).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 2).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 3).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 4).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 5).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 6).ViolinPlot.FaceAlpha = 0.5;
    
    volp(1, 1).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 2).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 3).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 4).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 5).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 6).ViolinPlot.EdgeColor = [222 222 222]./255;
    
    volp(1, 1).ViolinPlot.FaceColor = [129 129 129]./255;
    volp(1, 2).ViolinPlot.FaceColor = [129 129 129]./255;
    volp(1, 3).ViolinPlot.FaceColor = [40 154 215]./255;
    volp(1, 4).ViolinPlot.FaceColor = [40 154 215]./255;
    volp(1, 5).ViolinPlot.FaceColor = [223 34 101]./255;
    volp(1, 6).ViolinPlot.FaceColor = [223 34 101]./255;
    
    volp(1, 1).ScatterPlot.MarkerFaceColor = [129 129 129]./255;
    volp(1, 2).ScatterPlot.MarkerFaceColor = [129 129 129]./255;
    volp(1, 3).ScatterPlot.MarkerFaceColor = [40 154 215]./255;
    volp(1, 4).ScatterPlot.MarkerFaceColor = [40 154 215]./255;
    volp(1, 5).ScatterPlot.MarkerFaceColor = [223 34 101]./255;
    volp(1, 6).ScatterPlot.MarkerFaceColor = [223 34 101]./255;
    
    volp(1, 1).ViolinPlot.Parent.XLim = [0.3 6.7];
    volp(1, 1).ViolinPlot.Parent.XColor = [0 0 0];
    volp(1, 1).ViolinPlot.Parent.YColor = [0 0 0];
    volp(1, 1).ViolinPlot.Parent.LineWidth = 1;
    volp(1, 1).ViolinPlot.Parent.FontSize = 20;
    %volp(1, 1).ViolinPlot.Parent.Parent.Position = [90 204 974 662];
    volp(1, 1).ViolinPlot.Parent.YTick = [-0.2 -0.1 0 0.1 0.2];

%% figure 7B right panel
figure(2)
    volp = violinplot([base_within25 base_across25 F_within25 F_across25 O_within25 O_across25]);
    set(gca, 'XTick', 1:6);
    set(gca,'FontName','Helvetica','FontSize',20);
    ylim([-0.2,0.15]);
    volp(1, 1).ViolinPlot.LineWidth = 0.5;
    volp(1, 2).ViolinPlot.LineWidth = 0.5;
    volp(1, 3).ViolinPlot.LineWidth = 0.5;
    volp(1, 4).ViolinPlot.LineWidth = 0.5;
    volp(1, 5).ViolinPlot.LineWidth = 0.5;
    volp(1, 6).ViolinPlot.LineWidth = 0.5;
    
    volp(1, 1).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 2).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 3).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 4).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 5).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 6).ViolinPlot.FaceAlpha = 0.5;
    
    volp(1, 1).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 2).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 3).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 4).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 5).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 6).ViolinPlot.EdgeColor = [222 222 222]./255;
    
    volp(1, 1).ViolinPlot.FaceColor = [129 129 129]./255;
    volp(1, 2).ViolinPlot.FaceColor = [129 129 129]./255;
    volp(1, 3).ViolinPlot.FaceColor = [40 154 215]./255;
    volp(1, 4).ViolinPlot.FaceColor = [40 154 215]./255;
    volp(1, 5).ViolinPlot.FaceColor = [223 34 101]./255;
    volp(1, 6).ViolinPlot.FaceColor = [223 34 101]./255;
    
    volp(1, 1).ScatterPlot.MarkerFaceColor = [129 129 129]./255;
    volp(1, 2).ScatterPlot.MarkerFaceColor = [129 129 129]./255;
    volp(1, 3).ScatterPlot.MarkerFaceColor = [40 154 215]./255;
    volp(1, 4).ScatterPlot.MarkerFaceColor = [40 154 215]./255;
    volp(1, 5).ScatterPlot.MarkerFaceColor = [223 34 101]./255;
    volp(1, 6).ScatterPlot.MarkerFaceColor = [223 34 101]./255;
    
    volp(1, 1).ViolinPlot.Parent.XLim = [0.3 6.7];
    volp(1, 1).ViolinPlot.Parent.XColor = [0 0 0];
    volp(1, 1).ViolinPlot.Parent.YColor = [0 0 0];
    volp(1, 1).ViolinPlot.Parent.LineWidth = 1;
    volp(1, 1).ViolinPlot.Parent.FontSize = 20;
    %volp(1, 1).ViolinPlot.Parent.Parent.Position = [90 204 974 662];
    volp(1, 1).ViolinPlot.Parent.YTick = [-0.1 0 0.1];
%% figure 7C right panel
figure(3)
    volp = violinplot([base_within34 base_across34 F_within34 F_across34 O_within34 O_across34]);
    set(gca, 'XTick', 1:6);
    set(gca,'FontName','Helvetica','FontSize',20);
    ylim([-0.3,0.3]);
    volp(1, 1).ViolinPlot.LineWidth = 0.5;
    volp(1, 2).ViolinPlot.LineWidth = 0.5;
    volp(1, 3).ViolinPlot.LineWidth = 0.5;
    volp(1, 4).ViolinPlot.LineWidth = 0.5;
    volp(1, 5).ViolinPlot.LineWidth = 0.5;
    volp(1, 6).ViolinPlot.LineWidth = 0.5;
    
    volp(1, 1).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 2).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 3).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 4).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 5).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 6).ViolinPlot.FaceAlpha = 0.5;
    
    volp(1, 1).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 2).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 3).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 4).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 5).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 6).ViolinPlot.EdgeColor = [222 222 222]./255;
    
    volp(1, 1).ViolinPlot.FaceColor = [129 129 129]./255;
    volp(1, 2).ViolinPlot.FaceColor = [129 129 129]./255;
    volp(1, 3).ViolinPlot.FaceColor = [40 154 215]./255;
    volp(1, 4).ViolinPlot.FaceColor = [40 154 215]./255;
    volp(1, 5).ViolinPlot.FaceColor = [223 34 101]./255;
    volp(1, 6).ViolinPlot.FaceColor = [223 34 101]./255;
    
    volp(1, 1).ScatterPlot.MarkerFaceColor = [129 129 129]./255;
    volp(1, 2).ScatterPlot.MarkerFaceColor = [129 129 129]./255;
    volp(1, 3).ScatterPlot.MarkerFaceColor = [40 154 215]./255;
    volp(1, 4).ScatterPlot.MarkerFaceColor = [40 154 215]./255;
    volp(1, 5).ScatterPlot.MarkerFaceColor = [223 34 101]./255;
    volp(1, 6).ScatterPlot.MarkerFaceColor = [223 34 101]./255;
    
    volp(1, 1).ViolinPlot.Parent.XLim = [0.3 6.7];
    volp(1, 1).ViolinPlot.Parent.XColor = [0 0 0];
    volp(1, 1).ViolinPlot.Parent.YColor = [0 0 0];
    volp(1, 1).ViolinPlot.Parent.LineWidth = 1;
    volp(1, 1).ViolinPlot.Parent.FontSize = 20;
    %volp(1, 1).ViolinPlot.Parent.Parent.Position = [90 204 974 662];
    volp(1, 1).ViolinPlot.Parent.YTick = [-0.2 -0.1 0 0.1 0.2];


%% Figure 7 middle panel, we add the node label manually according to the complementary state pairs
figure(4)
A = ones(7,7)-eye(7);
order = [1:7];
G = graph(A);
G = reordernodes(G,order);
% codeN = {'VIS','SM','DAN','VAN','LIM','FPN','DMN'};
% h = plot(G,'layout','circle','nodelabel',codeN);
h = plot(G,'layout','circle');
h.EdgeColor = [0 0 0];
h.LineStyle = '--';
h.MarkerSize = 10;
highlight(h,[1,2,3,1],'LineStyle','-','EdgeColor','k','LineWidth',2)
highlight(h,[4,5,6,7,4,6,7,5],'LineStyle','-','EdgeColor','k','LineWidth',2)
highlight(h,[1,2,3],'NodeColor','r')
h.NodeLabelColor = 'w'




