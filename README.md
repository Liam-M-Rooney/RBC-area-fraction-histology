# Quantification of Eyrthrocyte Area Fraction for Histology Images
An ImageJ macro to determine the area of erythrocytes in H&E-stained mammalian tissue sections imaged by brightfield transmission microscopy.

# Pre-processing steps:
(1) Open brightfield transmission data, scale accordingly. Select ROIs and crop as required to ensure that tissue occupies the entire field of view - this is important when quantifying total area fraction without further processing steps.

(2) Conduct a colour deconvolution operation, chosing 'H&E2' with default perameters. Other colour deconvolution vectors may be optimised for different datasets. 

(3) Save colour deconvolution channel 2, which presents blood cells.

(4) Run this macro. Object analysis output will be automatically copied to clipboard upon completion, remember to save flattened overlay image for reference.


![image](https://github.com/Liam-M-Rooney/RBC-area-fraction-histology/assets/147630629/25bf7737-d585-46c0-add1-22cddda63593)

# Processing steps:
(1) Thresholding - used to segment erythrocytes from background and tissue in Channel 2 image generated via Colour Deconvolution pre-processing. 'Yen' was determined to be the optimal thresholding method for our data, but this may vary according to image quality and specimen type.

(2) Analyse Particles - a lower area limit of 5um^2 was selected to ensure that anything smaller than a single erythrocyte was not included in the analysis. An overlay is presented to provide a visualisation of the segmentation performance.

(3) Flatten - This operation flattens the segmentation overlay and creates a new image. This should be manually saved and stored as reference.

(4) Analysis results - the particle analysis results will be automatically stored on the user's clipboard following completion of the script. This can then be used for downstream analysis. To calculate the area fraction, the total area of the field of view should be measured (assuming that tissue occupies the entire field after initial cropping during pre-processing). The sum of the particle analysis areas should be divided by the total area of the image, resulting in the area fraction of erythrocytes per unit area of tissue.



It is recommended to repeat these analyses on at least 3 regions of interest per specimen, per experimental condition, taking each image's area fraction as a single replicate.
