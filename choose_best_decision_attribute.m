function [ bestAttr, maxGain ] = choose_best_decision_attribute( examples, attributes, binary_targets )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

  maxGain = -1;
  bestAttr = 0;
  
  t = size(binary_targets, 1);
  p = sum(binary_targets==1);
  n = sum(binary_targets==0);
  Ipn = -p/t * log2(p/t) -n/t * log2(n/t);
  for atIdx=1:size(attributes, 2)
      attribute = attributes(atIdx);
      attr = examples(:, attribute);
      gain = Ipn;
      %For '0' & '1' attr:
      for i=0:1
          at1 = sum(attr==i);
          bin_at1 = binary_targets(attr==i);
          bin_match = sum(bin_at1==1);
          bin_nomatch =sum(bin_at1==0);
          %Ipini = - bin_match/at1 * log2(bin_match/at1) - bin_nomatch/at1 * log2(bin_nomatch/at1);
          %if bin_match == 0
          %    Ipini = - bin_nomatch/at1 * log2(bin_nomatch/at1);
          %end
          %if bin_match == 1
          %    Ipini = - bin_match/at1 * log2(bin_match/at1);
          %end
          v_total = bin_match+bin_nomatch;
          v = [bin_match/v_total bin_nomatch/v_total];
          Ipini = - sum(v(v>0).*log2(v(v>0)));
          gain = gain - ((at1/t) * Ipini);
      end
      if gain > maxGain
          maxGain = gain;
          bestAttr = attribute;
      end
  end

end