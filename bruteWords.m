% function bruteWords
% looks only at ANSWER list and finds words that will maximally overlap
% with combined ANSWER+ALLOWED lists
%
% Corr = letter in correct position
% Pos = letter in word, but in wrong position
%
% Hrmm, I don't like the probability summation, and I'm not sure how to
% interpret the results


[allowedList, answerList] = loadWords;
allList = [allowedList; answerList];

for a = 1:length(answerList)
   [pCorr(a,:), pPos(a,:)] =  searchList(answerList(a,:),allList);
end

pCorrSum = sum(pCorr,2); % dodgy probability summation
pPosSum = sum(pPos,2);   

[~,ind] = max(pCorrSum);
wordMaxCorr = answerList(ind,:); % BASIS??? - has double letters!

[~,ind] = max(pPosSum);
wordMaxPos = answerList(ind,:); % ERASE - has double letters!

keyboard


function [pCorr, pPos] =  searchList(thisWord,allList)
% find probabilities for a single word

nWords = size(allList,1);

for lett = 1:length(thisWord)
    pCorr(lett) = sum(thisWord(lett)==allList(:,lett)) / nWords;
    pPos(lett) = sum(thisWord(lett)==allList(:)) / numel(allList);  % this might double-count letters if they appear twice in a word
end
end