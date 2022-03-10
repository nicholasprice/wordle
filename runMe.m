% function runMe
% Interactive World solver - advises next best word and requests score for
% the word
%
% options


% should select what round it transitions to only choosing words from the answerList
% also, there might be multiple minima, in which case it should be forced
% to select a word from the answerList

% GOFORGOLD mode only selects options from the answerList (i.e. use RAISE as first word, not ROATE) 
% GOFORSILVER mode swaps to the answerList on the second go.
mode = "LOSER"; %'GOFORGOLD'; GOFORGOLD = false; % 

[allowedList, answerList] = loadWords;

% Round 1
fprintf('Recommended first word is ROATE\n')
score = input('Enter score vector for ROATE\n For each letter\n 0 for not in word; 0.5 for wrong position; 1 for correct position\n e.g. [0 0 1 0.5 0]\n');

answerList = pruneList(answerList,'roate',score);
if mode=="GOFORSILVER"
    allowedList = [];
end
% Round 2+
a=2;
maxRounds = 6;
while a<maxRounds
    if size(answerList,1) < maxRounds-a+1
        allowedList = [];
    end
    bestWord = hackList(answerList,allowedList);
    fprintf('Recommended second word is %s\n', bestWord);
    score = input('Enter score vector\n');
    if isempty(score), return; end
    
    answerList = pruneList(answerList,bestWord,score);
    a = a+1;
end