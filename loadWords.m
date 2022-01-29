function [allowedList, answerList] = loadWords

tmp = fileread('C:\git\nicholasprice\wordle\WordList_Allowed.txt');
tmp2 = textscan(tmp,'%s');
allowedList = cell2mat(tmp2{1});

tmp = fileread('C:\git\nicholasprice\wordle\WordList_Answers.txt');
tmp2 = textscan(tmp,'%s');
answerList = cell2mat(tmp2{1});

% allList = [allowedList; answerList];
% 
% % find probability of letters across ALL words
% edges = double('a'):double('z')+1;
% nLett = histcounts(double(allList(:)),'Normalization','probability');
% 
% % nLett = histLett.Values;
% [sortLett,ind] = sort(nLett);
% label = char(edges(ind));
% 
% % find probability of letters in each position of ANSWER words
% for a=1:5
%     nLettPos(a,:) = histcounts(double(answerList(:,a)),'Normalization','probability');
%     [sortLettPos(a,:),ind] = sort(nLettPos(a,:));
%     labelPos(a,:) = char(edges(ind));
% end
% 
% figure
% bar(1:26,sortLett)
% set(gca,'xtick',1:26,'xticklabel',label(:))
% title('All words')
% 
% figure
% for a = 1:5
%     subplot(2,3,a)
%     bar(1:26,sortLettPos(a,:))
%     set(gca,'xtick',1:26,'xticklabel',labelPos(a,:)')
%     title("Position " + a)
%     ylim([0 0.2])
% end
%     
