function [ ] = GenerateInputs( x,y,emotion )
    ain = 1:1:45;
    xin = x;
    yin = y == emotion;
    tree = DecisionTreeLearning(xin,ain,yin);
    for i=1:20
        TestExample = x(i,:);
        output = FindLabel(tree, TestExample)
    end
    DrawDecisionTree(tree, 'Tree');
end

