
function ret = getProbeName(connector)
%
% function ret = getProbeName(connector)
%
% Requests the name of the probe on the specified connector
% and put it in the workspace as a new variable (TML_ProbeName).
%
% (C) JMM, INSERM 2010


disp(' ')
disp([' - Requesting probe name on connector ', num2str(connector),'...']);

if(nargin~=1)
    connector =0;
end

try

    ret = calllib('TexoMatlabLibrary', 'getProbeName', connector);

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - Probe name put in workspace(as "TML_ProbeName").')
    end

catch
    disp('   - Call to function "getProbeName" failed.');
end


