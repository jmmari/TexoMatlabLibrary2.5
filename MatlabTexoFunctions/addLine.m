
function ret = addLine()
%
% function ret = addLine()
%
% Adds a line to the definition of a custom sequence
%
% (C) R Criddle, Imperial College 2009

disp(' ')
disp(' - Adding line to sequence...');

try

    ret = calllib('TexoMatlabLibrary', 'addLine');

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - The line has been added.')
    end

catch
    disp('   - Call to function "addLine" failed.');
end

