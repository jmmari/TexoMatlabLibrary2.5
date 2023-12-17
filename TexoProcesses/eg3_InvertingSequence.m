
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
    createInvertingSequence('+0-0+0-0');

    % Take the image and save the data:
    takeScan();
    saveFile = [saveFolder, 'InvertingSequence.bin'];
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

figure;         % Grayscale image of a frame
imagesc(log(1+abs(hilbert(frame'))));
colormap(gray);

figure;         % Plot of two lines which should be inverses
hold on
plot(data(127, :), 'k')
plot(-data(128, :), 'r')


