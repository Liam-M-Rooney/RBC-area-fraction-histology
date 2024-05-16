//Author: LMR, Date: 11 May 2024

//macro for segmenting and calculating the area of blood sloghs
//in H&E histopathology brightfield transmission microscopy data.

//Pre-processing steps:
// (1) open brightfield transmission data, scale accordingly. Select rois and crop.
// (2) Conduct a colour deconvolution operation, chosing 'H&E2' with default perameters.
// (3) Save colour deconvolution channel 2, which presents blood cells.
// (4) Run this macro. Object analysis output will be automatically copied to clipboard upon completion, remember to save flattened overlay image for reference.

//Thresholding - 'Yen' was the optimal algorythm for these data. 'Auto' was selected for all analyses.
setAutoThreshold("Yen no-reset");
//run("Threshold...");
//setThreshold(0, 190);
setOption("BlackBackground", true);
run("Convert to Mask");

//Analyse particles - a lower area limit of 5um^2 was selected, which should remove any errant tissue artefacts from colour deconvolution, without screening out single erythrocytes.
run("Analyze Particles...", "size=5-Infinity show=[Overlay Masks] display clear overlay");

//A 'Flatten' operation on the Overlay projection will create a reference image of all analysed objects from mask. This shows the measured objects (i.e., sloughed RBCs). 
run("Flatten");

//copy analysis results to clipboard for downstream processing in Excel/Prism.
String.copyResults();
