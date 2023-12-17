
function ret = createHighSpeedSequence(pulseShape, numberLines, depth, txFrequency, focusDistance)
% 
% function ret = createHighSpeedSequence(pulseShape, numberLines, depth,
% txFrequency, focusDistance)
% 
% Create a high speed imaging sequence in the Texo engine
%   - pulseShape will be the shape of the pulse
%   - numberLines is how many lines will make up the sequence
%   - depth is the depth of the acquisition
%   - txFrequency is the frequency of transmitted ultrasound
%   - focusDistance is the distance where the trasmission focuses
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

disp(' ')
disp(' - Creating a high speed sequence...');

try

    ret = calllib('TexoMatlabLibrary', 'createHighSpeedSequence', pulseShape, numberLines, depth, txFrequency, focusDistance);

    if ret ~= 0
        errorCode(ret);
    else
        disp(' - Sequence created successfully.')
    end

catch
    disp('   - Call to function "createHighSpeedSequence" failed.');
end



