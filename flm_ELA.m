clc;clear all;close all
%%
addpath 'F:\Energy_landscape\code\energy-landscape-analysis-master'
load bi_TS.mat bi_postFRO bi_postOCC bi_preBase
OutputFolder = 'F:\Energy_landscape\data\Base_results\';
%%
Name = {'VIS','SM','DAN','VAN','LIM','FPN','DMN'};
binarizedData = bi_postFRO;
[h,J] = pfunc_02_Inferrer_PL(binarizedData);

%
he = sum(binarizedData,2)./size(binarizedData,2);
Je = zeros(size(binarizedData,1),size(binarizedData,1));
for i = 1:size(binarizedData,1)
    for j = 1:size(binarizedData,1)
        Je(i,j) = binarizedData(i,:)*binarizedData(j,:)'./size(binarizedData,2);
    end
end
Je = Je-eye(size(binarizedData,1));



%%[h,J] = pfunc_02_Inferrer_PL(binarizedData);
[probN, prob1, prob2, rD, r] = pfunc_03_Accuracy(h, J, binarizedData);
% probN: empirical prob dist (exact), 
% prob1: independent MEM 
% prob2; pairwise MEM 
%% Calculate Energy
% Calculate Energy
E = mfunc_Energy(h, J);

%% Calculate Local Minima
nodeNumber = length(h);
[LocalMinIndex, BasinGraph, AdjacentList] = mfunc_LocalMin(nodeNumber, E);
% BasinGraph = (Start Node,  End Node,  Belong to Local Minima)
%% Calculate Energy path by Dijkstra
[Cost, Path] = mfunc_DisconnectivityGraph(E, LocalMinIndex, AdjacentList);
%     [costs] is an LxM matrix of minimum cost values for the minimal paths
%     [paths] is an LxM cell array containing the shortest path arrays
vectorList = mfunc_VectorList(nodeNumber);
mfunc_ActivityMap(vectorList, LocalMinIndex, Name);

%% get dynamics
Nmin = length(LocalMinIndex);
StateNumber = mfunc_GetStateNumber(binarizedData);
BasinNumber = mfunc_GetBasinNumber(StateNumber, BasinGraph, LocalMinIndex);
Dynamics = mfunc_GetDynamics(BasinNumber, Nmin);

%% get individual dynamics
group_prob = zeros(15,Nmin);
group_LT = zeros(15,Nmin);
group_Dtrans = zeros(15,Nmin,Nmin);
group_Trans = zeros(15,Nmin,Nmin);
for i = 1:15
    ind_BasinNumber = BasinNumber(1+(i-1)*595:595*i);
    Dynamics = mfunc_GetDynamics(ind_BasinNumber, Nmin); 
    group_prob(i,:) = Dynamics.Freq;
    group_Dtrans(i,:,:) = Dynamics.Dtrans;
    group_Trans(i,:,:) = Dynamics.Trans;
    group_LT(i,:) = Dynamics.LT*1.25;
end


%%
Nsim = 10^5;
sim_group_prob = zeros(15,Nmin);
sim_group_LT = zeros(15,Nmin);
sim_group_Dtrans = zeros(15,Nmin,Nmin);
sim_group_Trans = zeros(15,Nmin,Nmin);
for iter = 1:15
[steps, stepsBasins] = metrophastings(Nsim, E, BasinGraph);
stepsBasins = stepsBasins(100:end);
for i = 1:length(LocalMinIndex)
    for j = 1:length(stepsBasins)
    if stepsBasins(j)==LocalMinIndex(i)
       stepsBasins(j)=i;
    end
    end
end
Dynamics_sim = mfunc_GetDynamics(stepsBasins, Nmin);
    sim_group_prob(iter,:) = Dynamics_sim.Freq;
    sim_group_Dtrans(iter,:,:) = Dynamics_sim.Dtrans;
    sim_group_Trans(iter,:,:) = Dynamics_sim.Trans;
    sim_group_LT(iter,:) = Dynamics_sim.LT*1.25;
end


%save postFROdym.mat.mat Dynamics Dynamics_sim group_prob group_Dtrans group_Trans group_LT sim_group_prob sim_group_Dtrans sim_group_Trans sim_group_LT h J Cost Path probN prob2 rD r
% h = figure(103);print(h,'Base_activMap.jpg','-r300','-djpeg');






%% Show Data
% nFiles = 1;
% fSaveBasinList = true;
% formatOut = 'yyyymmdd_HH_MM_SS';
% ProcessDate = datestr(now, formatOut);
% 
% ResultFileName = [OutputFolder 'result_' ProcessDate '.txt'];
% 
% % Create output data
% diary(ResultFileName);
% disp('Result');
% 
% disp(['nodeNumber = ', num2str(nodeNumber)]);
% h
% J
% r
% 
% for i=1:size(LocalMinIndex)
%     fprintf('LocalMinimum %d : state %d \n', i, LocalMinIndex(i));
% end
% 
% disp('BasinGraph = (Start Node,  End Node,  Belong to Local Minima)');
% BasinGraph
% diary off;
% 
% % save basin list file
% if fSaveBasinList
%     BasinFileName = [OutputFolder 'BasinList_' ProcessDate '.txt'];
%     diary(BasinFileName);
%     disp('Local Minimum Number: Basin List');
%     for i=1:length(LocalMinIndex)
%         ind = BasinGraph(:,3) == LocalMinIndex(i);
%         disp([num2str(LocalMinIndex(i)) ' : ' num2str(BasinGraph(ind)')]);
%     end
%     diary off; 
%     % Save mat file (added from ver.2)
%     BasinDataName = [OutputFolder 'BasinData_' ProcessDate '.mat'];
%     save(BasinDataName, 'BasinGraph', 'LocalMinIndex');
% end
% 
% % save figures
% % figure number = 100 - 103
% % When you add figures, need to modify followings.
% for i=100:103
%     h = figure(i);
%     % if you choose eps file
%     saveas(h, [OutputFolder 'figure_' num2str(i) '.eps'], 'epsc');
%     % if you choose svg file
%     saveas(h, [OutputFolder 'figure_' num2str(i)], 'svg');
% end
% 
% disp('ended')