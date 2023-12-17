
function ret = activateProbeConnector(connector)
%
% function ret = activateProbeConnector(connector)
% function ret = activateProbeConnector()
%
% Activates connector on the scanner (default is 0)
%
% (C) JMM, INSERM 2010.

disp(' ')
disp(' - Activating connector...')

try

    if (nargin==0)  % If no duration has been specified as an argument
        ret = calllib('TexoMatlabLibrary', 'activateProbeConnector', 0);
    else            % If duration has been specified
        ret = calllib('TexoMatlabLibrary', 'activateProbeConnector', connector);
    end

     if ret == 0
        disp(' - Connector activated.');
    else
        disp('   - Call to function "activateProbeConnector" failed.');
    end

catch
    disp('   - Call to function "activateProbeConnector" failed.');
end


