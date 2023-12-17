
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
    createAlternatingSequence('+0-0', '+0-0+0-0');

    % Take the image and save the data:
    takeScan();
    saveFile = [saveFolder, 'AlternatingSequence.bin'];
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

for i=1:properties.nbLines/2
    frame(i,:) = data(2*i-1,:);
end

figure;
imagesc(log(1+abs(hilbert(frame'))));
colormap(gray);

