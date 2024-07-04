clc;clear all;close all
%%%%%%%%%%%%%%
%% this code was used to plot figure 3A, 3C, 4E, 4G, 4I
%% load the state dynamics and plot figure 3A
cmap = [129 129 129
40 154 215
223 34 101]./255;
load postFROdym.mat
Fpost_Prob =  group_prob;
Fpost_LT = group_LT;
Fpost_Dtrans = group_Dtrans;
Fpost_Trans = group_Trans;
sim_Fpost_LT = sim_group_LT;
figure
subplot 132
h = scatter(log(prob2),log(probN));
set(h,'markeredgecolor',cmap(2,:))
load postOCCdym.mat
Opost_Prob = group_prob;
Opost_LT = group_LT;
Opost_Dtrans = group_Dtrans;
Opost_Trans = group_Trans;
sim_Opost_LT = sim_group_LT;
subplot 133
h = scatter(log(prob2),log(probN));
set(h,'markeredgecolor',cmap(3,:))
load Mean_Base_dym.mat
Base_Prob = group_prob;
Base_LT = group_LT;
Base_Dtrans = group_Dtrans;
Base_Trans = group_Trans;
sim_Base_LT = sim_group_LT;
subplot 131
h = scatter(log(prob2),log(probN));
set(h,'markeredgecolor',cmap(1,:))
Nmin = 6; 
%%
Fpost_Dtrans_s2d = zeros(15,Nmin);
Fpost_Trans_s2d = zeros(15,Nmin);
Opost_Dtrans_s2d = zeros(15,Nmin);
Opost_Trans_s2d = zeros(15,Nmin);
Base_Dtrans_s2d = zeros(15,Nmin);
Base_Trans_s2d = zeros(15,Nmin);

for i  = 1:15

    ind_Fpost_Dtrans = squeeze(Fpost_Dtrans(i,:,:));
    ind_Fpost_Trans = squeeze(Fpost_Trans(i,:,:));
    
    ind_Opost_Dtrans = squeeze(Opost_Dtrans(i,:,:));
    ind_Opost_Trans = squeeze(Opost_Trans(i,:,:));
    
    ind_Base_Dtrans = squeeze(Base_Dtrans(i,:,:));
    ind_Base_Trans = squeeze(Base_Trans(i,:,:));

    
    Fpost_Dtrans_s2d(i,:) = sum(ind_Fpost_Dtrans,2);
    Fpost_Trans_s2d(i,:) = sum(ind_Fpost_Trans,2);
    
    Opost_Dtrans_s2d(i,:) = sum(ind_Opost_Dtrans,2);
    Opost_Trans_s2d(i,:) = sum(ind_Opost_Trans,2);
    
    Base_Dtrans_s2d(i,:) = sum(ind_Base_Dtrans,2);
    Base_Trans_s2d(i,:) = sum(ind_Base_Trans,2);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% statistic analysis of appearance prob. (data)
State = {'S1','S2','S3','S4','S5','S6'};
for i = 1:Nmin
    a = Base_Prob(:,i);
    g1 = repmat({'a'},size(a));
    b = Fpost_Prob(:,i);
    g2 = repmat({'b'},size(b));
    c = Opost_Prob(:,i);
    g3 = repmat({'c'},size(c));
    data_prob = [a;b;c];
    group =  [g1;g2;g3];
    [p1(i),table1(:,:,i),stats1] = kruskalwallis(data_prob,group);
    [cc(i,:,:),m,h,gnames] = multcompare(stats1,'Alpha',0.05,'CType','bonferroni','Display','on');
end
%% figure 3C, here we plot the appearance prob.(data) for all six states, then modify the figure manually according to the statistic analysis
figure;
for i = 1:Nmin
    a = Base_Prob(:,i);
    
    b = Fpost_Prob(:,i);
    
    c = Opost_Prob(:,i);  
    
    
    subplot(2,3,i)
    volp = violinplot([a b c]);
    set(gca, 'XTick', 1:3, 'XTickLabels', {['Baseline'],['postFRO'],['postOCC']});
    set(gca,'FontName','Helvetica','FontSize',20);
    title(State{i});
    ylim([min([a',b',c'])-0.05,max([a',b',c'])+0.1]);
    if i==1 || i==4
        ylabel('Appearance prob. (data)')
    end
    volp(1, 1).ViolinPlot.LineWidth = 0.5;
    volp(1, 2).ViolinPlot.LineWidth = 0.5;
    volp(1, 3).ViolinPlot.LineWidth = 0.5;
    volp(1, 1).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 2).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 3).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 1).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 2).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 3).ViolinPlot.EdgeColor = [222 222 222]./255;
    
    volp(1, 1).ViolinPlot.FaceColor = [129 129 129]./255;
    volp(1, 2).ViolinPlot.FaceColor = [40 154 215]./255;
    volp(1, 3).ViolinPlot.FaceColor = [223 34 101]./255;
    volp(1, 1).ScatterPlot.MarkerFaceColor = [129 129 129]./255;
    volp(1, 2).ScatterPlot.MarkerFaceColor = [40 154 215]./255;
    volp(1, 3).ScatterPlot.MarkerFaceColor = [223 34 101]./255;
    volp(1, 1).ViolinPlot.Parent.XLim = [0.3 3.6];
    volp(1, 1).ViolinPlot.Parent.XColor = [0 0 0];
    volp(1, 1).ViolinPlot.Parent.YColor = [0 0 0];
    volp(1, 1).ViolinPlot.Parent.LineWidth = 1;
    volp(1, 1).ViolinPlot.Parent.FontSize = 20;
    volp(1, 1).ViolinPlot.Parent.Parent.Position = [90 204 974 662];
    volp(1, 1).ViolinPlot.Parent.YTick = [0 0.1 0.2 0.3 0.4];    
end  
%% statistic analysis of state duration (data)
for i = 1:Nmin
    a = Base_LT(:,i);
    g1 = repmat({'a'},size(a));
    b = Fpost_LT(:,i);
    g2 = repmat({'b'},size(b));
    c = Opost_LT(:,i);
    g3 = repmat({'c'},size(c));
    data_LT = [a;b;c];
    group =  [g1;g2;g3];
    [p2(i),table2(:,:,i),stats2] = kruskalwallis(data_LT,group);
    [cc(i,:,:),m,h,gnames] = multcompare(stats2,'Alpha',0.05,'CType','bonferroni','Display','on');
end
%% figure 4I, here we plot the state duration (data) for all six states, then modify the figure manually according to the statistic analysis
figure;
for i = 1:Nmin
    a = Base_LT(:,i);
    
    b = Fpost_LT(:,i);
    
    c = Opost_LT(:,i);  
    
    subplot(2,3,i)
    volp = violinplot([a b c]);
    set(gca, 'XTick', 1:3, 'XTickLabels', {['Baseline'],['postFRO'],['postOCC']});
    set(gca,'FontName','Helvetica','FontSize',20);
    title(State{i});
    ylim([min([a',b',c'])-1,max([a',b',c'])+2]);
    if i==1 || i==4
        ylabel('State duration (data)')
    end
    volp(1, 1).ViolinPlot.LineWidth = 0.5;
    volp(1, 2).ViolinPlot.LineWidth = 0.5;
    volp(1, 3).ViolinPlot.LineWidth = 0.5;
    volp(1, 1).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 2).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 3).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 1).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 2).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 3).ViolinPlot.EdgeColor = [222 222 222]./255;
    
    volp(1, 1).ViolinPlot.FaceColor = [129 129 129]./255;
    volp(1, 2).ViolinPlot.FaceColor = [40 154 215]./255;
    volp(1, 3).ViolinPlot.FaceColor = [223 34 101]./255;
    volp(1, 1).ScatterPlot.MarkerFaceColor = [129 129 129]./255;
    volp(1, 2).ScatterPlot.MarkerFaceColor = [40 154 215]./255;
    volp(1, 3).ScatterPlot.MarkerFaceColor = [223 34 101]./255;
    volp(1, 1).ViolinPlot.Parent.XLim = [0.3 3.6];
    volp(1, 1).ViolinPlot.Parent.XColor = [0 0 0];
    volp(1, 1).ViolinPlot.Parent.YColor = [0 0 0];
    volp(1, 1).ViolinPlot.Parent.LineWidth = 1;
    volp(1, 1).ViolinPlot.Parent.FontSize = 20;
    volp(1, 1).ViolinPlot.Parent.Parent.Position = [90 204 974 662];
    volp(1, 1).ViolinPlot.Parent.YTick = [0 2 4 6 8];
    
end    
%% statistic analysis of transition frequency (data)
for i = 1:Nmin
    a = Base_Trans_s2d(:,i);
    g1 = repmat({'a'},size(a));
    b = Fpost_Trans_s2d(:,i);
    g2 = repmat({'b'},size(b));
    c = Opost_Trans_s2d(:,i);
    g3 = repmat({'c'},size(c));
    data_s2d_trans = [a;b;c];
    group =  [g1;g2;g3];
    [p3(i),table3(:,:,i),stats3] = kruskalwallis(data_s2d_trans,group);
    [cc(i,:,:),m,h,gnames] = multcompare(stats3,'Alpha',0.05,'CType','bonferroni','Display','on');
end
%% figure 4E, here we plot the transition frequency (data) for all six states, then modify the figure manually according to the statistic analysis
figure;
for i = 1:Nmin
    a = Base_Trans_s2d(:,i);
    
    b = Fpost_Trans_s2d(:,i);
    
    c = Opost_Trans_s2d(:,i);  
    
    subplot(2,3,i)
    volp = violinplot([a b c]);
    set(gca, 'XTick', 1:3, 'XTickLabels', {['Baseline'],['postFRO'],['postOCC']});
    set(gca,'FontName','Helvetica','FontSize',20);
    title(State{i});
    ylim([min([a',b',c'])-0.02,max([a',b',c'])+0.04]);
    if i==1 || i==4
        ylabel('Transition freq. (data)')
    end
    volp(1, 1).ViolinPlot.LineWidth = 0.5;
    volp(1, 2).ViolinPlot.LineWidth = 0.5;
    volp(1, 3).ViolinPlot.LineWidth = 0.5;
    volp(1, 1).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 2).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 3).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 1).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 2).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 3).ViolinPlot.EdgeColor = [222 222 222]./255;
    
    volp(1, 1).ViolinPlot.FaceColor = [129 129 129]./255;
    volp(1, 2).ViolinPlot.FaceColor = [40 154 215]./255;
    volp(1, 3).ViolinPlot.FaceColor = [223 34 101]./255;
    volp(1, 1).ScatterPlot.MarkerFaceColor = [129 129 129]./255;
    volp(1, 2).ScatterPlot.MarkerFaceColor = [40 154 215]./255;
    volp(1, 3).ScatterPlot.MarkerFaceColor = [223 34 101]./255;
    volp(1, 1).ViolinPlot.Parent.XLim = [0.3 3.6];
    volp(1, 1).ViolinPlot.Parent.XColor = [0 0 0];
    volp(1, 1).ViolinPlot.Parent.YColor = [0 0 0];
    volp(1, 1).ViolinPlot.Parent.LineWidth = 1;
    volp(1, 1).ViolinPlot.Parent.FontSize = 20;
    volp(1, 1).ViolinPlot.Parent.Parent.Position = [90 204 974 662];
    volp(1, 1).ViolinPlot.Parent.YTick = [0 0.1 0.2];
end    
%% statistic analysis of direct transition frequency (data)
for i = 1:Nmin
    a = Base_Dtrans_s2d(:,i);
    g1 = repmat({'a'},size(a));
    b = Fpost_Dtrans_s2d(:,i);
    g2 = repmat({'b'},size(b));
    c = Opost_Dtrans_s2d(:,i);
    g3 = repmat({'c'},size(c));
    data_s2d_Dtrans = [a;b;c];
    group =  [g1;g2;g3];
    [p5(i),table5(:,:,i),stats5] = kruskalwallis(data_s2d_Dtrans,group);
    [cc(i,:,:),m,h,gnames] = multcompare(stats5,'Alpha',0.05,'CType','bonferroni','Display','on');
end

%% figure 4G, here we plot the direct transition frequency (data) for all six states, then modify the figure manually according to the statistic analysis
figure;
for i = 1:Nmin
    a = Base_Dtrans_s2d(:,i);
    
    b = Fpost_Dtrans_s2d(:,i);
    
    c = Opost_Dtrans_s2d(:,i);  
    
    subplot(2,3,i)
    volp = violinplot([a b c]);
    set(gca, 'XTick', 1:3, 'XTickLabels', {['Baseline'],['postFRO'],['postOCC']});
    set(gca,'FontName','Helvetica','FontSize',20);
    title(State{i});
    ylim([min([a',b',c'])-0.005,max([a',b',c'])+0.014]);
    if i==1 || i==4
        ylabel('Direct transition (data)')
    end
    volp(1, 1).ViolinPlot.LineWidth = 0.5;
    volp(1, 2).ViolinPlot.LineWidth = 0.5;
    volp(1, 3).ViolinPlot.LineWidth = 0.5;
    volp(1, 1).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 2).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 3).ViolinPlot.FaceAlpha = 0.5;
    volp(1, 1).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 2).ViolinPlot.EdgeColor = [222 222 222]./255;
    volp(1, 3).ViolinPlot.EdgeColor = [222 222 222]./255;
    
    volp(1, 1).ViolinPlot.FaceColor = [129 129 129]./255;
    volp(1, 2).ViolinPlot.FaceColor = [40 154 215]./255;
    volp(1, 3).ViolinPlot.FaceColor = [223 34 101]./255;
    volp(1, 1).ScatterPlot.MarkerFaceColor = [129 129 129]./255;
    volp(1, 2).ScatterPlot.MarkerFaceColor = [40 154 215]./255;
    volp(1, 3).ScatterPlot.MarkerFaceColor = [223 34 101]./255;
    volp(1, 1).ViolinPlot.Parent.XLim = [0.3 3.6];
    volp(1, 1).ViolinPlot.Parent.XColor = [0 0 0];
    volp(1, 1).ViolinPlot.Parent.YColor = [0 0 0];
    volp(1, 1).ViolinPlot.Parent.LineWidth = 1;
    volp(1, 1).ViolinPlot.Parent.FontSize = 20;
    volp(1, 1).ViolinPlot.Parent.Parent.Position = [90 204 974 662];
    volp(1, 1).ViolinPlot.Parent.YTick = [0 0.02 0.04 0.06];
end    