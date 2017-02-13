function [ classification_rate, Recall, Precision, F1, C_matrix, tree ] = xVal( x, y, runs )

foldSize = floor(size(x, 1) / 10);

output = [];
yutput = [];

if (nargin < 3)
    runs = 1;
end

for run=1:runs
    for i=0:9
        foldIndices = 1+i*foldSize:(i+1)*foldSize;
        allIndices = 1:size(x, 1);
        allIndices(foldIndices) = [];
        testX = x(foldIndices, :);
        trainX = x(allIndices, :);
        testY = y(foldIndices, :);
        trainY = y(allIndices, :);

        tree = {};
        for j=1:6
          tree{j} = DecisionTreeLearning(trainX, 1:45, trainY==j);
          % DrawDecisionTree(tree{j});
        end
        %results = testTrees(tree, testX(1:foldSize,:)); % for random scheme
        %results = testTreesWithDepth(tree, testX(1:foldSize,:)); % for min depth scheme
        results = testTreesWithGainHeight(tree, testX(1:foldSize,:)); % for min depth scheme
        output = [output results];
        yutput = [yutput transpose(testY)];

    end
end

% following 2 lines: calculate hit rate
diff = output==yutput;
classification_rate = sum(diff)/size(diff,2);

C_matrix = xValConfusion( output, yutput );

norm_C_matrix = normalise(C_matrix);

[Recall, Precision, F1] = Classification_Measure(norm_C_matrix);


end

