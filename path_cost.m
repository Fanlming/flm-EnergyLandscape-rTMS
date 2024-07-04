clc;clear all;close all
addpath F:\Energy_landscape\code\energy-landscape-analysis-master
load minimum_path_cost.mat
%% plot figure 5A
figure;imagesc(Base_Cost);colorbar('Limits',[-1.155,0]);colormap('hot')
figure;imagesc(F_Cost);colorbar('Limits',[-1.155,0]);colormap('hot')
figure;imagesc(O_Cost);colorbar('Limits',[-1.155,0]);colormap('hot')
%%
Base_s2d_energy = abs(sum(Base_Cost))';
F_s2d_energy = abs(sum(F_Cost))';
O_s2d_energy = abs(sum(O_Cost))';
Nnum = 6;
for i = 1:Nnum
    for j = 1:Nnum
        Base_path_length(i,j) = length(Base_Path{i,j});  
        F_path_length(i,j) = length(F_Path{i,j});  
        O_path_length(i,j) = length(O_Path{i,j});  
        
        
    end
end
Base_path_length =Base_path_length-eye(6);
F_path_length = F_path_length-eye(6);
O_path_length = O_path_length-eye(6);
m_base_path = sum(sum(Base_path_length))./30;
m_F_path = sum(sum(F_path_length))./30;
m_O_path = sum(sum(O_path_length))./30;



%% plot figure 6A
Base_exam = Base_Path{2,5};
mfunc_ActivityMap(vectorList, Base_exam);
h = figure(103);print(h,'Baseline_2to5.jpg','-r300','-djpeg');
F_exam = F_Path{2,5};
mfunc_ActivityMap(vectorList, F_exam);
h = figure(103);print(h,'postFRO_2to5.jpg','-r300','-djpeg');
O_exam = O_Path{2,5};
mfunc_ActivityMap(vectorList, O_exam);
h = figure(103);print(h,'postOCC_2to5.jpg','-r300','-djpeg');
%% plot figure 6B
Base_exam = Base_Path{4,1};
mfunc_ActivityMap(vectorList, Base_exam);
h = figure(103);print(h,'Baseline_4to1.jpg','-r300','-djpeg');
F_exam = F_Path{4,1};
mfunc_ActivityMap(vectorList, F_exam);
h = figure(103);print(h,'postFRO_4to1.jpg','-r300','-djpeg');
O_exam = O_Path{4,1};
mfunc_ActivityMap(vectorList, O_exam);
h = figure(103);print(h,'postOCC_4to1.jpg','-r300','-djpeg');
%% plot figure 6C
Base_exam = Base_Path{2,6};
mfunc_ActivityMap(vectorList, Base_exam);
h = figure(103);print(h,'Baseline_2to6.jpg','-r300','-djpeg');
F_exam = F_Path{2,6};
mfunc_ActivityMap(vectorList, F_exam);
h = figure(103);print(h,'postFRO_2to6.jpg','-r300','-djpeg');
O_exam = O_Path{2,6};
mfunc_ActivityMap(vectorList, O_exam);
h = figure(103);print(h,'postOCC_2to6.jpg','-r300','-djpeg');