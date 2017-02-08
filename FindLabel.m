function [ o ] = FindLabel( tree, example )
% inputs:
% tree: a single tree to be traversed
% example: row vector of attributes corresponding to input example
% output: class (1 if tree classifies example as +ve, 0 if -ve)
    if size(tree.op) == 0
        o = tree.class;
    else
        branchTaken = example(tree.op);
        o = FindLabel(tree.kids{branchTaken+1}, example);
    end
    return
end

