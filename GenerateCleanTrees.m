function [ ] = GenerateCleanTrees( x,y )
    ain = 1:1:45;
    xin = x;
    for i=1:6
        tree(i) = DecisionTreeLearning(xin,ain,y==i);
        DrawDecisionTree(tree(i), strcat('Clean data-trained tree for emotion ',num2str(i)));
    end
end
