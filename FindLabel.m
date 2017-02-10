function [ o, d ] = FindLabel( tree, example )
% inputs:
% tree: a single tree to be traversed
% example: row vector of attributes corresponding to input example
% output:
% o: class (1 if tree classifies example as +ve, 0 if -ve)
% d: depth of traversal for successful classification
    if size(tree.op) == 0
        o = tree.class;
        d = 0;
    else
        branchTaken = example(tree.op);
        [o, d] = FindLabel(tree.kids{branchTaken+1}, example);
        d = d + 1;
    end
    return
end

