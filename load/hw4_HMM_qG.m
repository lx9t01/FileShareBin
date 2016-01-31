clear;
clc;

%read file 'ron.txt'
fid = fopen('ron.txt');
formatSpec = '%s';
sizeA = 1;
Nrows = numel(textread('ron.txt','%1c%*[^\n]'));
for i=1:Nrows
    raw_mood{i} = fscanf(fid, formatSpec, sizeA);
    raw_genre{i} = fscanf(fid, formatSpec, sizeA);
end
fclose(fid);

%declare number of states (mood) and 
%number of types of observations (genre)
numGenreType=10;
numMoodType=4;
%assign a number to each state to simplify the classification
moodType = struct('happy',1,'mellow',2,'sad',3,'angry',4);
genreType = struct('pop',1,'rock',2,'dubstep',3,'rap',4,'folk',5, ...
    'metal', 6, 'jazz',7,'blues',8,'house',9,'classical',10);

for i=1:Nrows
    moodTypeNumbering(i) = [getfield(moodType,raw_mood{i})];
    genreTypeNumbering(i) = [getfield(genreType,raw_genre{i})];
end

clear fid formatSpec i sizeA

    