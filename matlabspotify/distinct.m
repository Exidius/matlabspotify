
file1 = 'billboard_combined3.mat';
file2 = 'not_billboard_filtered_combined.mat';

f1=importdata(file1);

distinctValues = f1(1);
temp = [];

for i = 2:length(f1)
    found = false;
    j = 1;
    while found == false && j < length(distinctValues)
        if f1(i).track(1).id == distinctValues(j).track(1).id
            found = true;
        end
        j=j+1;
    end
    if found == false
        distinctValues = [distinctValues,f1(i)];
    end
end

billboard_filtered_distinct = distinctValues(randperm(length(distinctValues)));

f1=importdata(file2);

distinctValues = f1(1);
temp = [];

for i = 2:length(f1)
    found = false;
    j = 1;
    while found == false && j < length(distinctValues)
        if f1(i).track(1).id == distinctValues(j).track(1).id
            found = true;
        end
        j=j+1;
    end
    if found == false
        distinctValues = [distinctValues,f1(i)];
    end
end

notbillboard_filtered_distinct = distinctValues(randperm(length(distinctValues)));