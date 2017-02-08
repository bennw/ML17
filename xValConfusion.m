function [ ] = xValConfusion( output, yutput )

  plotconfusion(full(ind2vec(yutput', 6)), full(ind2vec(vec2ind(output'), 6)));

end

