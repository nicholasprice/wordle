

p = 
entropy = -sum(p.*log(p));

% or information associated with each letter is simply log(p)
% but we should calculate it separately for each position
% Ideally we would pick the single word that maximises information
% by choosing the most-likely letter in each position, but that will rarely
% be possible
% How do we prioritise letters? Maybe based on steps down to next most
% likely letter in each position?
SEOEY
 RI
 OA
 A   xxEY