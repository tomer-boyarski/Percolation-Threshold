%finding bond percolation threshold for square maze

clear all
close all
clear
clc
figure
hold on
tic
n=50;% number of steps on the 'p' axis
m=600;%number of repetitions 
h=1/n;%step size
p=0:h:1;
s=[10,20,40,80];%maze sizes
count=zeros(length(s),n+1); % number of successes per maze size and per (p)
max_diff=zeros(1,length(s)); %max diff in chance of success
legend_info=cell(length(s),1);%legend for size of maze
index=zeros(1,length(s));%the indeces of the threshold
for j=1:length(s) %size of matrix
    maze_size=s(j); 
    for i=1:n+1 %looping through each p
        for q=1:m % checking many matrices 
        count(j,i)=count(j,i)+yesorno(p(i),maze_size); %number of successes
        end
    end
    count(j,:)=count(j,:)/(m); %averaging out on many matrices
    [max_diff(j),index(j)]=max(diff(count(j,:))); %finding max change in chance of success 
    legend_info{j}=['for maze size = ',num2str(maze_size),' the threshold value is ' ,num2str(1-p(index(j)))];

end
count_index=sub2ind(size(count),1:length(s),index);
plot(1-p,count,1-p(index),count(count_index),'or');
legend(legend_info,'position',[0.2,0.2,0.25,0.3],'fontsize',15);
title('chance of success as function of p','fontsize',20);
xlabel('p','fontsize',15);
ylabel('chance of success','fontsize',15);
ylim([-0.1,1.1]);
hold off
time = toc;