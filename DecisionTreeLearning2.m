function [ tree ] = DecisionTreeLearning2( examples,attributes,binary_targets )
    
    n_ones = sum(binary_targets == 1);
    n_zeros = sum(binary_targets == 0);
    n_examples = size(binary_targets,1);
    
    if(n_ones == n_examples)
        tree.class = 1;
        tree.kids = [];
        
    elseif size(attributes) == 0
        tree.kids = [];
        tree.class = n_ones > n_zeros;
    else
        best_attr = choose_best_decision_attribute(examples, attributes, binary_targets);
        tree.op = best_attr;
        for i=0:1:1
            examples_i = examples(examples(:,best_attr) ==i,:);
            binarytargets_i = binary_targets(examples(:,best_attr) ==i,:);
            if(size(examples_i) == 0)
                tree.kids = [];
                tree.class = n_ones > n_zeros;
            else
                attributes = attributes(attributes ~= best_attr);
                subtree = DecisionTreeLearning2(examples_i, attributes, binarytargets_i);
            end
        end
    end
end

