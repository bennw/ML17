function [ o ] = testTreesWithGainHeight( T, x2 )
% CLASSIFIES INPUT DATA WITH TREE GAIN HEIGHT AS TIEBREAKING PARAMETER
% inputs: T: size (n_emotions) cell array of trees
% x2: (n_attr x n_cases) matrix of input test cases
% output: size (n_cases) vector of predicted emotions
n_attr = size(x2, 2);
n_cases = size(x2, 1);
n_emotions = numel(T);
for t=1:n_cases
    prediction = -1;
    bestgain = 0;
    gv = zeros(1, n_emotions);
    for i=1:n_emotions
        [l, d, g] = FindLabel(T{i}, x2(t,:));
        gv(i) = g;
        if l == 1 && g > bestgain
            prediction = i;
            bestgain = g;
        end
    end
    if prediction == -1
        o(t) = randi(6);
    else
        o(t) = prediction;
    end
end
% end of fxn
end