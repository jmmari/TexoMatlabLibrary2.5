
clear all;
close all;
clc;

% Initialise the library:
[saveFolder, configFolder, libraryFolder, settingsFolder] = openPaths();
initTexoMatlabLibrary(libraryFolder);

try
    % Prepare the scanner:
    startEngine(settingsFolder, 40);
    configFile = [configFolder, 'DefaultConfigFile.txt'];
    loadConfigData(configFile);

    % Create a sequence:
    returnScannerSettings(true);
    displayScannerSettings(TML_ScannerSettings);

    setPower(13, 13, 13)
    setLibraryVariable('focus', 40000);
    setLibraryVariable('depth', 60000);

    returnScannerSettings(true);
    displayScannerSettings(TML_ScannerSettings);

    beginSequence();
    for i=1:3
        centerElement = 20*i;   % 20, 40, 60 tenth of elements
        setLibraryVariable('txCenterElement', centerElement);
        setLibraryVariable('rxCenterElement', round(centerElement/2));

        angle = (i-2)*100;		% -100, 0, 100
        setLibraryVariable('angle', angle);
        
        setLibraryVariable('pulseShape', '+');
        addLine();

        setLibraryVariable('pulseShape', '+-+-');
        addLine();

        setLibraryVariable('txAngle', angle);
        setLibraryVariable('rxAngle', -angle);
        setLibraryVariable('pulseShape', '---------');
        addLine();
    end
    endSequence();

    % Take the image and save the data:
    takeScan();
    saveFile = [saveFolder, 'CustomSequence.bin'];
    saveData(saveFile, 1);

    % Stop the engine and close the library:
    stopEngine();

catch
    disp('   - Error: Texo procedure failed.');
    disp('   - Attempting to stop engine and recover...');
    stopEngine();
    pause(2);
end

closeTexoMatlabLibrary;

% Process the data:
[data, properties] = readSavedFile(saveFile);

figure;
imagesc(log(1+abs(hilbert(data'))));
colormap(gray);
