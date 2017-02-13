function [ o, d, g ] = FindLabel( tree, example )
% inputs:
% tree: a single tree to be traversed
% example: row vector of attributes corresponding to input example
% output:
% o: class (1 if tree classifies example as +ve, 0 if -ve)
% d: depth of traversal for successful classification
% g: sum of gain at each node encountered
    if size(tree.op) == 0
        o = tree.class;
        d = 0;
        g = 0;
    else
        branchTaken = example(tree.op);
        [o, d, g] = FindLabel(tree.kids{branchTaken+1}, example);
        d = d + 1;
        g = g + tree.gain;
    end
    return
end

