import matlab.net.http.RequestLine
import matlab.net.*
import matlab.net.http.*

file1 = 'billboard_filtered_distinct.mat';
file2 = 'notbillboard_filtered_distinct.mat';

f1=importdata(file1);

i = 1;
features = [];

while i < length(f1)
    ids = [];
    j = 1;
    while i < length(f1) && j <= 100
        ids = [ids,f1(i).track(1).id,','];
        j = j+1;
        i = i+1;
    end

    urlpart1 = 'https://api.spotify.com/v1/audio-features/?ids=';
    headerFields = {'Authorization', ['Bearer ', 'BQB8tO8KbOXO9EAiohqS3PdQ2thsTFiIdHvG4qdTbd-KCBMcMyUtFTy_4R16YPhapSfH-gEiZyG2YL4LNu_Jbvm735gyZV_wJNPOvjFy8fC0erJr1oO1fU8E-CjlWJMFRN_Y20tRCjT3su5y81M']};
    options = weboptions('HeaderFields', headerFields, 'ContentType','json');
    answer = webread(strcat(urlpart1,ids),options);
    features = [features,answer];
end

features_billboard = [];


for i = 1:length(features)
    audio_features = features(i).audio_features;
    for j = 1:length(audio_features)
        features_billboard = [features_billboard,features(i).audio_features(j)]
    end
end




f1=importdata(file2);

i = 1;
features = [];

while i < length(f1)
    ids = [];
    j = 1;
    while i < length(f1) && j <= 100
        ids = [ids,f1(i).track(1).id,','];
        j = j+1;
        i = i+1;
    end

    urlpart1 = 'https://api.spotify.com/v1/audio-features/?ids=';
    headerFields = {'Authorization', ['Bearer ', 'BQB8tO8KbOXO9EAiohqS3PdQ2thsTFiIdHvG4qdTbd-KCBMcMyUtFTy_4R16YPhapSfH-gEiZyG2YL4LNu_Jbvm735gyZV_wJNPOvjFy8fC0erJr1oO1fU8E-CjlWJMFRN_Y20tRCjT3su5y81M']};
    options = weboptions('HeaderFields', headerFields, 'ContentType','json');
    answer = webread(strcat(urlpart1,ids),options);
    features = [features,answer];
end

features_notbillboard = [];


for i = 1:length(features)
    audio_features = features(i).audio_features;
    for j = 1:length(audio_features)
        features_notbillboard = [features_notbillboard,features(i).audio_features(j)]
    end
end
