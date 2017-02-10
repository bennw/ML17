function [ o ] = testTreesWithDepth( T, x2 )
% CLASSIFIES INPUT DATA WITH TREE DEPTH AS TIEBREAKING PARAMETER
% inputs: T: size (n_emotions) cell array of trees
% x2: (n_attr x n_cases) matrix of input test cases
% output: size (n_cases) vector of predicted emotions
n_attr = size(x2, 2);
n_cases = size(x2, 1);
n_emotions = numel(T);
for t=1:n_cases
    prediction = -1;
    bestdepth = n_attr + 1;
    for i=1:n_emotions
        [l, d] = FindLabel(T{i}, x2(t,:));
        if l == 1 && d < bestdepth
            prediction = i;
            bestdepth = d;
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

