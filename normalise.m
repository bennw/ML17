function [ normalised ] = normalise( confusion )
    for i=1:6
        normalised(i,:) = confusion(i,:)/sum(confusion(i,:)); 
    end
end

