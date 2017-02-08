function [ ] = GenerateInputs( x,y )
    ain = 1:1:45;
    xin = x;
    for i=1:6
        trees(i) = DecisionTreeLearning(xin,ain,y==i);
    end
    a = testTrees(trees, x(1:20,:))
    %DrawDecisionTree(tree(1), 'Tree');
end

