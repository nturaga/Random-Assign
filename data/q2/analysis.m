sample = gctparse('P8.gct');

%set first two columns to name
gn = {};
gd = {};

gn = num2cell(sample.ge(:,1));
gd = num2cell(sample.ge(:,1));

sample.gn = gn;
sample.gd = gd;

%Remove the first two columns
sample.ge(:,1) = [];
sample.ge(:,1) = [];
%Get counts of all the instances
val = unique(sample.ge(:,1));
instances = hist(sample.ge(:,1),val);
%Count instances of 105 and 401
count105 = instances(105);
count401 = instances(401);
%Calculate the log2RP1 values of all the instances
log2RP1 = log2(sample.ge(:,3));

%Plot for RID = 105

rid105 = [];
j = 1;
for i=1:length(sample.ge(:,1))
    if (sample.ge(i,1)==105 &&  sample.ge(i,3)~=0)
        rid105(j,:) = [sample.ge(i,1) , sample.ge(i,2), log2(sample.ge(i,3))];
        j = j+1;
    end
end

% plot(rid105(:,3),rid105(:,2));
figure()
hist(rid105(:,3),50);
hold on
ylabel('count');
xlabel('log2 expression');
title('RID = 105');

%Plot for RID = 401.

rid401 = [];
k = 1;
for f=1:length(sample.ge(:,1))
    if (sample.ge(f,1)==401 && sample.ge(f,3)~=0)
        rid401(k,:) = [sample.ge(f,1) , sample.ge(f,2),log2(sample.ge(f,3))];
        k = k+1;
    end
end
figure()
hist(rid401(:,3),50);
hold on
ylabel('count');
xlabel('log2 expression');
title('RID = 401');



% Plot for time vs log2(RP1) for RID = 105
figure()
plot(rid105(:,2),rid105(:,3))
hold on
xlabel('time');
ylabel('log2 expression');
title('RID = 105');


%Plot without outliers
figure()
rid105new = []
for i=1:length(rid105(:,3))
    if (rid105(i,3)> (mean(rid105(:,3))-std(rid105(:,3))))
       rid105new(i,:) = rid105(i,:) 
    end
end
rid105new(all(rid105new==0,2),:)=[]
plot(rid105new(:,2),rid105new(:,3))
hold on
xlabel('time');
ylabel('log2 expression');
title('RID = 105 After removing outliers');

% Plot for time vs log2(RP1) for RID = 401
figure()
plot(rid401(:,2),rid401(:,3))
hold on
xlabel('time');
ylabel('log2 expression');
title('RID = 401');


%Plot without outliers

figure()
rid401new = []
for i=1:length(rid401(:,3))
    if (rid401(i,3)> (mean(rid401(:,3))-std(rid401(:,3))))
       rid401new(i,:) = rid401(i,:) 
    end
end
rid401new(all(rid401new==0,2),:)=[]
plot(rid401new(:,2),rid401new(:,3))
hold on
xlabel('time');
ylabel('log2 expression');
title('RID = 401 After removing outliers');
