function [ output, yutput ] = xVal( x, y )


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
    
    results = zeros(foldSize, 6);
    for k=1:foldSize
        for j=1:6
          results(k, j) = evalTree(tree{j}, testX(k, :));
        end
    end
    
    output = [output; results];
    yutput = [yutput; testY];

end

