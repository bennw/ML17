function [ hitrate ] = xVal( x, y )


foldSize = floor(size(x, 1) / 10);

output = [];
yutput = [];

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
    end
    results = testTrees(tree, testX(1:foldSize,:)); % see testTrees.m for classification criteria

    output = [output results];
    yutput = [yutput transpose(testY)];

end

% following 2 lines: calculate hit rate
diff = output==yutput;
hitrate = sum(diff)/size(diff,2);

end

