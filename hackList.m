function bestWord = hackList(answerList,allowedList)
%
% find the word that will maximally shorten the current list (on average)
% i.e. even if the word is wrong, it will still (even if the word is wrong)
%
% Hrmm, is this even possible?
% Would need to do NxN tests
% i.e. assume X is the correct word (from Answer List), how much does choosing Y (from Allowed List) reduce the
% length of Answer list. 
% Then choose the single Allowed word that reduces the length of the word list on average
% Took 1274 s to find 'ROATE' as optimal first word

if nargin==0
    [allowedList, answerList] = loadWords;
    answerList = pruneList(answerList,'roate',[0 1 0 0 0]);
    answerList = pruneList(answerList,'bludy',[0 0.5 1 0.5 0]);
    
%     allowedList = ['abc';'abd';'bad';'edb';'cde'];
%     answerList = ['eee';'abb';'aab';'cab'];
end

allList = [allowedList; answerList];

% nAllow = size(allowedList,1);
nAnswer = size(answerList,1);
nAll = size(allList,1);
tic
% it's about 1 second/word => 2315 seconds for everything = 40 min
% running in parallel threads we're ~0.5 s/word

pRemain = zeros(nAnswer, nAll); 
parpool('threads')
parfor a = 1:nAnswer
    thisAnswer = answerList(a,:); % assume this is the actual answer
     a
    for b = 1:nAll
        thisWord = allList(b,:); % word to check
        score = scoreWord(thisWord,thisAnswer);
        outList = pruneList(answerList,thisWord,score);
        pRemain(a,b) = size(outList,1) / nAnswer;
    end
end
delete(gcp('nocreate'))
toc

% need to do something about summing probabilities here?
% presumably we want the word in allList that leads to the lowest probability across all words in the
% answer list
pSum = sum(pRemain,1); % sum across all answers - this should be 1xnAll
[~,ind] = min(pSum);
allList(ind,:)
% ROATE is best first word
% It's not clear to me when to swap to only using words in the answer vs
% the the full word list. 


keyboard