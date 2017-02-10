function [ C ] = xValConfusion( output, yutput )
  plotconfusion(full(ind2vec(yutput, 6)), full(ind2vec(output, 6)));
  C = confusionmat(yutput, output);
end

