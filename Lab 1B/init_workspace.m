% Add folders to path
thisfile = which(mfilename);
exercisefolder = fileparts(thisfile);
cd(exercisefolder);
addpath(genpath(exercisefolder));
clear thisfile exercisefolder;

% Add params to workspace
run("..\abbirb120params")