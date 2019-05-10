
combined_not_billboard_not_filtered = [];
billboard_combined2 = [];
% Specify the folder where the files live.
billboardFolder = 'C:\develop\matlabspotify\billboard';
playlistsFolder = 'C:\develop\matlabspotify\playlists';
% Check to make sure that folder actually exists.  Warn user if it doesn't.
% if ~isdir(myFolder)
%   errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
%   uiwait(warndlg(errorMessage));
%   return;
% end
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(billboardFolder, '*.mat'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(billboardFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);

  i = importdata(fullFileName);
  billboard_combined2 = [billboard_combined2,i];
end

filePattern2 = fullfile(playlistsFolder, '*.mat'); % Change to whatever pattern you need.
theFiles2 = dir(filePattern2);
for k = 1 : length(theFiles2)
  baseFileName2 = theFiles2(k).name;
  fullFileName2 = fullfile(playlistsFolder, baseFileName2);
  fprintf(1, 'Now reading %s\n', fullFileName2);

  i = importdata(fullFileName2);
  combined_not_billboard_not_filtered = [combined_not_billboard_not_filtered,i];
end

%combined = [importdata(file1),importdata(file2),importdata(file3),importdata(file4),importdata(file5)];