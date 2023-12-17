
function ret = closeTexoMatlabLibrary()
%
% function ret = closeTexoMatlabLibrary()
%
% Use this function to shutdown the TexoMatlabLibrary and
% free the occupied memory.
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

disp(' ')
disp(' - Closing the Texo Library...')

try

%     state = enableservice('AutomationServer', false);
%     pause(0.5);
%     m = libfunctions('TexoMatlabLibrary', '-full')    % For testing
    unloadlibrary('TexoMatlabLibrary');
    pause(1);
    ret = 0;
    disp(' - Texo library successfully unloaded.');

catch
    ret = -1;
    disp('   - Warning: Texo library was not successfully unloaded.');
end
