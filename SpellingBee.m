% First attempt. Slow as. Generating every possible arbitrary combination
% of letters is clearly a waste of time. 

tic

% Load Scrabble wordlist
tmp = fileread('C:\git\nicholasprice\wordle\scrabbleDictionary.txt');
tmp2 = textscan(tmp,'%s');
wordList = tmp2{1};

lenWord = 13; %6; % number of letters in target word

n = cellfun('length',wordList);
wordList = wordList(n==lenWord);

letterList = upper('matrcoi'); % first letter is the central letter
nLett = length(letterList);

nWord = nLett^lenWord; % number of possible combinations

ind = 0;
for a = 0:nWord-1 
    if mod(a,100) = 0, a, end
    
    % MAKE WORD
   indWord = dec2base(a,nLett,lenWord);
    % add 1 to each index
    for b=1:length(indWord)
        thisWord(b) = letterList(str2num(indWord(b))+1);
    end
    
    % CHECK WORD
    % must include first letter in letterList
    % then, need to compare it against wordList. Probably a massive
    % speed-up if we reject words of the wrong length to start off with. 
   if ~any(thisWord==letterList(1))
       continue
   end
   
   if contains(thisWord,wordList)
       ind = ind+1;
       storeWord{ind} = thisWord;
   end
   
end

toc