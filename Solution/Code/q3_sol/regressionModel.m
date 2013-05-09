% Please use the gctparse.m file in the same folder, as this script
% uses the function.This is a long
% process, and takes about 45 minutes to run on my computer.
%
predictors = importdata('predictors.grp');
train = gctparse('train.gct');
% remaining = setdiff(train.gd(:,1),predictors(:,1));

% Get the set of dependant variables which include the 21289 genes
% and their expression profiles across the 2519 samples.  remaining_genes = false(length(train.ge),1);
remaining_genes = ismember(train.gd,predictors);

size(train.ge)
%979 independent values are called remaining_expr
remaining_expr = train.ge(remaining_genes,:);

%The rest are my dependent variables 21289
dependant_expr = train.ge(~remaining_genes,:);

number_dependent = sum(~remaining_genes);
number_predictors = sum(remaining_genes);
coefficients = zeros(number_dependent,number_predictors + 1 );
rsquareds = zeros(number_dependent,1);
number_samples = size(remaining_expr,2);

% We can use mvregress which does not evaluate the training error of our model.But instead I
% use regstats, which gives me the adjrsquared of my model.

for predicted=1:number_dependent
    %for predicted=1:300
    
    %alternative
    % %     a = mvregress([ones(number_samples,1),remaining_expr'],dependant_expr(predicted,:)');
    
    a = regstats(dependant_expr(predicted,:)',remaining_expr');
    
    coefficients(predicted,:) = a.beta;
    rsquareds(predicted) = a.adjrsquare;
end

%Plot the adjusted square values.
plot(rsquareds);
title('rsquared');
xlabel('number_dependent');
