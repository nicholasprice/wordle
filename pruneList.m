function outList = pruneList(inList,word,score)
%
% given input word, this prunes the list of words based on the score
%
% score for each letter - 0=not in word; 0.5=wrong position; 1=correct position
%
% TODO: add pruning based on letter combinations. 
% e.g. if we score [0.5 0.5 0.5] for 'abc', then we know the correct answer
% must include all three letters, but in a different order

%% NEW - progressively reduce outList. Turns out this takes about the same amount of time!

outList = inList;

for a = 1:length(score)
    if score(a)==0 % letter not in word - remove all words containing the letter
        removeMe = any(outList==word(a),2);
    elseif score(a)==0.5 % letter in wrong position
        removeMe = outList(:,a)==word(a); % remove words with the letter in that position
        removeMe = removeMe | ~any(outList==word(a),2); % and words that don't contain the letter somewhere
    elseif score(a)==1 % letter in correct position - remove all words without that letter in that position
        removeMe = outList(:,a)~=word(a);
    end
    outList = outList(~removeMe,:);
end


%% OLD - has redundancies
% removeMe = false(size(inList(:,1)));
% 
% for a = 1:length(score)
%     if score(a)==0 % letter not in word - remove all words containing the letter
%         removeMe = removeMe | any(inList==word(a),2);
%     elseif score(a)==0.5 % letter in wrong position - remove all words with the letter in that position
%         removeMe = removeMe | inList(:,a)==word(a);
%     elseif score(a)==1 % letter in correct position - remove all words without that letter in that position
%         removeMe = removeMe | inList(:,a)~=word(a);
%     end
% end 
% 
% outList = inList(~removeMe,:);