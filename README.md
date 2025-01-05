# Autism_DVAE

A Feature Reduction Pipeline for the Diagnosis of Autism based on Resting-state fMRI



- `./data` contains two files as the sample data, `data_sample.npy` and `label_sample.npy`, which are the samples of functional connectivity features extracted based on the parcellations from Craddock et. al 2011 and the corresponding autism labels.
- `./scripts` contains a bash script to download the IMPAC dataset and clone this github repository for seamless local execution.
- `./src` contains all relevant scripts for dataset processing, model training and testing, and result analysis.


## Data:

We use the public dataset from: \
**Imaging-psychiatry challenge: predicting autism (IMPAC)**\
**A data challenge on Autism Spectrum Disorder detection** \
Roberto Toro (Institut Pasteur), Nicolas Traut (Institut Pasteur), Anita Beggiato (Institut Pasteur), Katja Heuer (Institut Pasteur), Gael Varoquaux (Inria, Parietal), Alex Gramfort (Inria, Parietal), Balazs Kegl (LAL), Guillaume Lemaitre (CDS), Alexandre Boucaud (CDS), and Joris van den Bossche (CDS)

- To access the complete dataset, please see the section below on how to download the data. 

## Requirements and Dependencies

Please check the links below for installing and setting up Jupyter or Anaconda: 

https://jupyter.org/install
https://docs.anaconda.com/

The follow packages are also required:
- `scipy`
- `numpy`
- `pandas`
- `sklearn`
- `nilearn`
- `neuroHarmonize`
- `matplotlib`
- `torch`
- `torchvision`

For a complete list and specific versions of all packages used, refer to the `requirements.txt` file.

## Instructions:

**1:** To reproduce our code locally, download `./scripts/impac_dvae.sh`, and run using the following commands:

```bash
chmod +x impac_dvae.sh
./impac_dvae.sh -o your_output_directory_name
```

Replace `your_output_directory_name` with the desired name of the output directory.


To reproduce our code in Google Colab, use the following code snippets:
```python 
# Mount your drive
from google.colab import drive
drive.mount('/content/drive')
```

```python
# Download the bash script
!wget -O impac_dvae.sh https://github.com/xinyuan-zheng/Autism_DVAE/tree/main/scripts/impac_dvae.sh
!chmod +x impac_dvae.sh
!./impac_dvae.sh -o your_output_directory_name 
```

**2:**
- `./src/get_fmri_data.ipynb` is a jupyter notebook to download the complete dataset and compute the connectivity features using atlas and parcellations. This code is a modified version of IMPAC's [autism_starting_kit.ipynb](https://nbviewer.org/github/ramp-kits/autism/blob/master/autism_starting_kit.ipynb), which can be accessed [here](https://nbviewer.org/github/ramp-kits/autism/blob/master/autism_starting_kit.ipynb).
   - For more information, please check the documentation from IMPAC [here](https://github.com/ramp-kits/autism).

**3:**
- `./src/vae.ipynb` is a jupyter notebook contains the steps to train and validate our VAE model, extract and classify the latent variables from the trained DVAE, visualize the loss function and classification results, as well as computation of bootstrap confidence intervals for different classifiers and permutation tests. In order to run `./src/vae.ipynb`, make sure to run `./src/get_fmri_data.ipynb` first to get the resting state-fMRI data. This script processes and saves the data and labels as numpy arrays in `./data`. 

- `./src/visualization.ipynb` is a jupyter notebook contains the steps to process and visualize the latent representations from the trained DVAE.


## Disclaimer:
Please note the scripts released in this repository are provided “as is” without warranty or guarantee of any kind, either express or implied, including but not limited to any warranty of noninfringement, merchantability, and/or fitness for a particular purpose. The use of the scripts and the tools is At Your Own Risk, the user is responsible for reviewing before use in any environment. We are not liable for any losses, damages or other liabilities.


