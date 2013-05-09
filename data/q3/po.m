x = zeros(1,length(remaining));
y = [];
for i=1:length(remaining)
    for j=1:length(train.gd)
        if (remaining(i)==train.gd(j))
            x(i) = train.ge(j,:);
        end
    end
end
