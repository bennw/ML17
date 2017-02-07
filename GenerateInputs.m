function [ ] = GenerateInputs( x,y,emotion )
    ain = 1:1:45;
    xin = x;
    yin = y == emotion;
    tree = DecisionTreeLearning(xin,ain,yin);
    DrawDecisionTree(tree, 'Tree');
    %TestExample = x(1,:);
    %output = FindLabel(tree, TestExample)
end

