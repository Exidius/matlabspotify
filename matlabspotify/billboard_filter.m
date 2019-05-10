
file1 = 'combined_not_billboard_not_filtered.mat';
file2 = 'billboard_combined2.mat';

f1=importdata(file1);
billboard=importdata(file2);

temp = []; %indices to remove

index = [];
index2 = 1;
for i = 1:length(f1)
    f1items = f1(i).items;
    for j = 1:length(f1items)
    a = f1(i).items(j).track(1).id;
    equals = false;
        for k = 1:length(billboard)
            billitems = billboard(k).items;
            for l = 1:length(billitems)
                b = billboard(k).items(l).track(1).id;
                
                reldate = extractBetween(f1(i).items(j).track(1).album(1).release_date,1,4);
                isold = str2double(reldate{1,1}) < 2014;
                if isequal(a,b) || isold
                    equals = true;
                end
            end
        end
    if equals == true
        asd = [i,j]';
        temp = [temp,asd];
    end
    end

end

temp = temp';
not_billboard_filtered_combined = [];
tempindex = 1;
i = 1;
while tempindex < size(temp,1) && i < length(f1)
    f1items = f1(i).items;
    for j = 1:length(f1items)
        if i == temp(tempindex,1) && j == temp(tempindex,2) 
            tempindex = tempindex+1;
        else
            not_billboard_filtered_combined = [not_billboard_filtered_combined,f1(i).items(j)];
        end
    end
    i = i+1;
end

billboard_combined3 = [];
for k = 1:length(billboard)
    billitems = billboard(k).items;
    for l = 1:length(billitems)
        billboard_combined3 = [billboard_combined3,billboard(k).items(l)];
    end
end

