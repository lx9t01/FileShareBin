clear;
clc;

%load the file
data=dlmread('sequenceprediction1.txt', '\t');

L=data(1,1); %load number of states
N=data(1,2); %load number of observations

AMatrix=data(2:1+L,1:L); %load the transition matrix
OMatrix=data(2+L:2*L+1,1:N); %load the observation matrix

%load the sequence
fid = fopen('sequenceprediction1.txt'); %open the file
for i = 1:2*L+1   %ignore the first 2L+1 lines for the matrices
    tline = fgetl(fid);
end

formatSpec = '%s';
sizeA = 1;
for i=1:5 %load the 5 sequences
    temp=fscanf(fid, formatSpec, sizeA);
    eval(sprintf('HMM_%d=[];',i));
    for k=1:length(temp);
        eval(sprintf('HMM_%d=[HMM_%d str2num(temp(%d))];',i,i,k));
    end
end

fclose(fid);
clearvars data fid formatSpec i k sizeA temp tline

