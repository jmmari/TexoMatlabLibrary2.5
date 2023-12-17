
function ret = initTexoMatlabLibrary(libFolder)
%
% function ret = initTexoMatlabLibrary(filesPath)
%
% Initialises the Texo library dll which is found at filesPath
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

addpath(libFolder);

disp(' ')
disp(' - Loading TexoTools library...');

% try

    loadlibrary([libFolder, 'TexoMatlabLibrary2.dll'], [libFolder, 'TexoMatlabLibrary2.h'], 'alias', 'TexoMatlabLibrary');
    pause(1);
%     m = libfunctions('TexoMatlabLibrary', '-full')    % For testing
    enableservice('AutomationServer', true);
    
    ret = 0;
    disp(' - TexoTools library initialised.');

% catch
%     ret = -1;
%     disp('   - TexoTools library initialisation failed.');
% end

