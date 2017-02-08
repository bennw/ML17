function [ value ] = evalTree( tree, example )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

   node = tree;
   while 1==1
       if size(node.op, 1) == 0
          value = node.class; 
          return;
       end
       if example(node.op) == 1
           node = node.kids{2};
       else
           node = node.kids{1};
       end
   end
end

