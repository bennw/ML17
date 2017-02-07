function [ o ] = FindLabel( tree, example )
    if isempty(tree.op)
        o = tree.class;
    else
        branchTaken = example(tree.op);
        o = FindLabel(tree.kids(branchTaken+1), example);
    end
    return
end

