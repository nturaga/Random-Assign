function depAndIndepExpr = getPredictorExpr()
%GETPREDICTOREXPR Summary of this function goes here
%   Detailed explanation goes here
    
	predictors = importdata('predictors.grp');
    train = gctparse(trainingSet);
	remaining = setdiff(train.gd(:,1),predictors(:,1));
	
% 	x = [];
% 	y = [];
% 	for i=1:length(remaining)
%     		for j=1:length(train.gd)
%         		if (strcmp(remaining(i),train.gd(j))==1)
%             			x(i,:) = train.ge(j,:);
%             			break;
%         		end
%     		end
% 	end
% 

	for i=1:length(predictors)
    		for j=1:length(train.gd)
        		if (strcmp(predictors(i),train.gd(j))==1)
            			y(i,:) = train.ge(j,:);
            			break;
        		end
    		end
	end
	
end



