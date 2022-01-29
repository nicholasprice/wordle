function score = scoreWord(inWord,correctWord)
% scores the "inWord" relative to the true "correctWord"
% score for each letter - 0=not in word; 0.5=wrong position; 1=correct position

score = zeros(size(inWord));
for a = 1:length(inWord) % go through letters
    if inWord(a)==correctWord(a)
        score(a) = 1;
    elseif any(inWord(a)==correctWord)
        score(a) = 0.5;
    end
end