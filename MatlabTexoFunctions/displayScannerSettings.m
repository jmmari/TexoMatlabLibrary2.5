
function displayScannerSettings(settings)
% 
% function displayScannerSettings(scannerSettings, allSettings)
% 
% Decodes and displays the settings returned from the scanner
%    - the list is complete if allSettings = true
%    - the list is partial if allSettings = false
%
% (C) JMM, Imperial College 2007
% Updated RC, Imperial College 2009

disp(' ')

if (length(settings) == 42)     % If it's all the settings

    disp(' - Complete scanner settings are:')
    disp(' ')
    disp(['           samplingFreq = ', num2str(settings(1))])
    disp(['                  power = ', num2str(settings(2))])
    disp(['       maxPositivePower = ', num2str(settings(3))])
    disp(['       maxNegativePower = ', num2str(settings(4))])
    disp(['                    TGC = ', num2str(settings(5))])
    disp(['      inputSignalConfig = ', num2str(settings(6))])
    disp(['    outputSignalConfig1 = ', num2str(settings(7))])
    disp(['    outputSingalConfig2 = ', num2str(settings(8))])
    disp(['         scannerPresent = ', num2str(settings(9))])
    disp(['            readyToScan = ', num2str(settings(10))])
    disp(['         sectorialProbe = ', num2str(settings(11))])
    disp(['         probeConnector = ', num2str(settings(12))])
    disp(['     numberFramesToSave = ', num2str(settings(13))])
    disp(['           scanDuration = ', num2str(settings(14))])
    disp(['            imagingMode = ', num2str(settings(15))])
    disp(['                subMode = ', num2str(settings(16))])
    disp(['     numberDopplerLines = ', num2str(settings(17))])
    disp(['    highSpeedLineNumber = ', num2str(settings(18))])
    disp(['        totalLineNumber = ', num2str(settings(19))])
    disp(' ')
    disp(['        txCentreElement = ', num2str(settings(20))])
    disp(['             txAperture = ', num2str(settings(21))])
    disp(['        txFocusDistance = ', num2str(settings(22))])
    disp(['                txAngle = ', num2str(settings(23))])
    disp(['            txFrequency = ', num2str(settings(24))])
    disp(['         txSpeedOfSound = ', num2str(settings(25))])
    disp(['      txUseManualDelays = ', num2str(settings(26))])
    disp(['           txTableIndex = ', num2str(settings(27))])
    disp(['      txUseDeadElements = ', num2str(settings(28))])
    disp(' ')
    disp(['        rxCentreElement = ', num2str(settings(29))])
    disp(['             rxAperture = ', num2str(settings(30))])
    disp(['                rxAngle = ', num2str(settings(31))])
    disp(['     rxMaxApertureDepth = ', num2str(settings(32))])
    disp(['     rxAcquisitionDepth = ', num2str(settings(33))])
    disp(['       rxChannelMask[0] = ', num2str(settings(34))])
    disp(['       rxChannelMask[1] = ', num2str(settings(35))])
    disp(['           rxApplyFocus = ', num2str(settings(36))])
    disp(['      rxUseManualDelays = ', num2str(settings(37))])
    disp(['   rxCustomLineDuration = ', num2str(settings(38))])
    disp(['             rxLGCValue = ', num2str(settings(39))])
    disp(['               rxTGCSel = ', num2str(settings(40))])
    disp(['           rxTableIndex = ', num2str(settings(41))])
    disp(['           rxDecimation = ', num2str(settings(42))])
    disp(' ')
	
elseif (length(settings) == 9)  % If it's the partial list

    disp(' - Partial scanner settings are:')
    disp(' ')
    disp(['         scannerPresent = ', num2str(settings(1))])
    disp(['           scanDuration = ', num2str(settings(2))])
    disp(['         sectorialProbe = ', num2str(settings(3))])
    disp(' ')
    disp(['        txFocusDistance = ', num2str(settings(4))])
    disp(['            txFrequency = ', num2str(settings(5))])
    disp(' ')
    disp(['     rxAcquisitionDepth = ', num2str(settings(6))])
    disp(['                rxAngle = ', num2str(settings(7))])
    disp(['           rxApplyFocus = ', num2str(settings(8))])
    disp(['           rxDecimation = ', num2str(settings(9))])
    disp(' ')

else
    disp('   - Error: Scanner settings have not been returned.')
    disp(' ')
end