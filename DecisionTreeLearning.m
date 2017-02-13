function [ tree ] = DecisionTreeLearning( examples,attributes,binary_targets )
    n_examples = size(binary_targets,1);
    n_ones = sum(binary_targets == 1);
    n_zeroes = sum(binary_targets == 0);
    if n_ones == n_examples
        % return leaf node 1
        tree.op = [];
        tree.kids = [];
        tree.class = 1;
    elseif n_zeroes == n_examples
        % return leaf node 0
        tree.op = [];
        tree.kids = [];
        tree.class = 0;
    elseif size(attributes) == 0
        % return leaf node with majorty(binary_targets)
        tree.op = [];
        tree.kids = [];
        tree.class = n_ones >= n_zeroes;
    else
        [best_attr, gain] = choose_best_decision_attribute( examples,attributes,binary_targets );
        tree.op = best_attr;
        tree.class = [];
        tree.gain = gain;
        for i = 0:1:1
            examples_i = examples(examples(:, best_attr) == i, :);
            binary_targets_i = binary_targets(examples(:, best_attr) == i, :);
            if size(examples_i, 1) == 0 % if there are no examples with this attr
                subtree.op = [];
                subtree.kids = [];
                subtree.class = n_ones >= n_zeroes;
            else
                attributes_i = attributes(attributes ~= best_attr);
                subtree = DecisionTreeLearning(examples_i, attributes_i, binary_targets_i);
            end
            tree.kids(i+1) = {subtree};
        end
    end
end
