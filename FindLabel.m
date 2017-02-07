function [ o ] = FindLabel( tree, example )
    if size(tree.op) == 0
        o = tree.class;
    else
        branchTaken = example(tree.op);
        o = FindLabel(tree.kids{branchTaken+1}, example);
    end
    return
end

