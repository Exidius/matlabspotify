file1 = 'features_notbillboard.mat';
file2 = 'features_billboard.mat';

features_notbillboard = importdata(file1);
features_billboard = importdata(file2);


notb = struct2table(features_notbillboard);
notb = table2cell(notb);
notb = cell2mat(notb(:,[1:11 17:18]));

b = struct2table(features_billboard);
b = table2cell(b);
b = cell2mat(b(:,[1:11 17:18]));

one = ones(length(b));
one = one(:,1);
b = [b one];

zero = zeros(length(notb));
zero = zero(:,1);
notb = [notb zero];

finaldata  = vertcat(b,notb);
finaldata = finaldata(randperm(size(finaldata,1)),:);

X=finaldata (:,1:end-1);
y=finaldata (:,end);

for i = 1:size(X,2)
mu(i) = mean(X(:,i));
sigma(i) = std(X(:,i));
for j = 1:length(X(:,i))
Xnorm(j,i)=(X(j,i)-mu(i))/sigma(i);
end
end
X=Xnorm ;

X=X';
y=y';
