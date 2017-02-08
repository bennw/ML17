function [ o ] = testTrees( T, x2 )
% inputs: T: size (n_emotions) cell array of trees
% x2: (n_attr x n_cases) matrix of input test cases
% output: size (n_cases) vector of predicted emotions
n_attr = size(x2, 2);
n_cases = size(x2, 1);
n_emotions = numel(T);
for t=1:n_cases
    prediction = [];
    for i=1:n_emotions
        if FindLabel(T{i}, x2(t,:)) == 1
            prediction = [prediction i];
        end
    end
    if size(prediction) == 1
        o(t) = prediction(1);
    elseif size(prediction) == 0
        o(t) = 0;%randi(6);
    else
        o(t) = -1;%prediction(randi(numel(prediction)));
    end
end
% end of fxn
end

