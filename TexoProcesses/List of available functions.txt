// This file lists the functions available in the TexoMatlab library:

int loadConfigData(const char *);
int takeScan();
int takeScanForDuration(int);
int saveData(char *, int);
int returnScannerSettings(bool);
int startEngine(char *, int);
int startImaging();
int stopImaging();
int stopEngine();
int activateProbeConnector(int);

int createStandardSequence();
int createStandardSequenceWithShape(char *);
int createAlternatingSequence();
int createAlternatingSequenceWithShape(char *, char *);
int createInvertingSequence();
int createInvertingSequenceWithShape(char *);
int createDopplerSequence(char *, int, int);
int createMDopplerSequence(char *, int);
int createHighSpeedSequence(char *, int, int, int, int);
int beginSequence();
int addLine();
int endSequence();

int setPower(int, int, int);
int setFrequency(int);
int setFocusDistance(int);
int setAcquisitionDepth(int);
int setAngle(int);
int setTxAngle(int);
int setRxAngle(int);
int setCenterElement(int);
int setTxCenterElement(int);
int setRxCenterElement(int);
int setPulseShape(char *);

int getProbeName(int);

int getProbeNumElements();
int getProbeCenterFreq();
int getFrameRate();
int getFrameSize();
int getMaxFrameCount();
int getCollectedFrameCount();
