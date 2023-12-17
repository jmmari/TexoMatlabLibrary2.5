function [saveFolder, configFolder, libraryFolder, settingsFolder] = openPaths()

% THIS MUST BE CHANGED WHENEVER THE LIBRARY IS INSTALLED / MOVED:
% The root directory where all TexoTools files are stored:
rootPath = 'D:\Sonix programming\TexoMatlabLibrary 2.5';

% DO NOT CHANGE THE REST, THEY ARE RELATIVE TO THE ROOT SO AUTOMATICALLY UPDATE 
% The folders used in the script:
saveFolder = [rootPath, '\SavedImages\'];
configFolder = [rootPath, '\ConfigFiles\'];
libraryFolder = [rootPath, '\TexoMatlabLibrary2.5\Release\'];
settingsFolder = [rootPath, '\dat\'];

% Folder containing the Matlab functions which call the library:
addpath([rootPath, '\MatlabTexoFunctions\']);

