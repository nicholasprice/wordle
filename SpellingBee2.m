% function SpellingBee2
% alternative approach - find all words that match the conditions
% i.e. word must include center letter and can't include non-surround letters
% I blame Alex for my lost productivity. 
% NP 11/03/2022

tic

% Load Scrabble wordlist
tmp = fileread('C:\git\nicholasprice\wordle\scrabbleDictionary.txt'); % upper case list
tmp2 = textscan(tmp,'%s');
wordList = tmp2{1};

letterList = upper('tvolgae'); % first letter is the central letter
notLetterList = setxor(char(double('A'):double('Z')),letterList); % these should not be in the word

wordList = wordList(contains(wordList,letterList(1))); % must include first letter

for a = 1:length(notLetterList) % exclude all words with non-desired letters
   wordList(contains(wordList,notLetterList(a))) = [];
end

toc
wordList'
