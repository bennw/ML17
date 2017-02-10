function [ recall, precision, F1 ] = Classification_Measure( confusion)
    F1 = zeros(6,1);
    recall = zeros(6,1);
    precision = zeros(6,1);
    for i=1:6
        tp = confusion(i,i);
        recall(i) = tp/sum(confusion(i,:));
        precision(i) = tp/(sum(confusion(:,i)));
        F1(i) = 2*(precision(i)*recall(i))/(precision(i)+recall(i));
    end
end

