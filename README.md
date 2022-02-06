## Prerequisite
- Python 3.6
- Numpy
- OpenCV
- [TensorFlow](https://www.tensorflow.org/install/install_linux) 1.15.0
- Anaconda
```bash
$ conda env create --file gender_classification.yml
```
## Usage
1. Clone the CZ4042 project repository:
```bash
$ git clone https://github.com/jhoong003/cz4042_proj.git
```

2. Download Adience Dataset:
```bash
python download_adiencedb.py
```

3. Split raw data into training set, validation set and testing set per fold for five-fold cross validation.
this project have been generated this txt files in DataPreparation/FiveFolds/train_val_test_per_fold_agegender.
if you want to generate the new one, you can utilize the following command:
```bash
python datapreparation.py \
	--inputdir=./adiencedb/aligned \
	--rawfoldsdir=./DataPreparation/FiveFolds/original_txt_files \
	--outfilesdir=./DataPreparation/FiveFolds/train_val_test_per_fold_agegender
```

4. Pre-process raw data to generate tfrecord files of training set, validation set and testing set in tfrecord directory:
```bash
python multipreproc.py \
	--fold_dir ./DataPreparation/FiveFolds/train_val_test_per_fold_agegender \
	--data_dir ./adiencedb/aligned \
	--tf_output_dir ./tfrecord
```

5. Train LMTCNN model or Levi_Hassner model. Trained models will store in models directory:
```bash
# five-fold LMTCNN model for age and gender tasks 
$ ./script/trainfold1_best.sh ~ $ ./script/trainfold5_best.sh 

# five-fold Levi_Hassner model for age task
$ ./script/trainagefold1.sh ~ $ ./script/trainagefold5.sh

# five-fold Levi_Hassner model for gender task
$ ./script/traingenderfold1.sh ~ $ ./script/traingenderfold5.sh
```
Training in NTU slurm cluster. Please refer to run_slurm.sh.
```bash
$ ./run_slurm.sh
```


6. Evalate LMTCNN model or Levi_Hassner models. Result will be store in results directory:
```bash
# five-fold LMTCNN model for age and gender tasks 
$ ./script/evalfold1_best.sh ~ $ ./script/evalfold5_best.sh 

# five-fold Levi_Hassner model for age task
$ ./script/evalagefold1.sh ~ $ ./script/evalagefold5.sh

# five-fold Levi_Hassner model for gender task
$ ./script/evalgenderfold1.sh ~ $ ./script/evalgenderfold5.sh
```

7. Inference aligned facial image and generate frozen model files(.pb file) which model size are illustrated in the paper. The frozen model files(.pb file) are stored in model directory:
```bash
# five-fold LMTCNN model for age and gender tasks 
$ ./script/inference1_best.sh ~ $ ./script/inference5_best.sh 

# five-fold Levi_Hassner model for age task
$ ./script/inferenceage1.sh ~ $ ./script/inferenceage5.sh

# five-fold Levi_Hassner model for gender task
$ ./script/inferencegender1.sh ~ $ ./script/inferencegender5.sh
``

## Reference Resources
[rude-carnie](https://github.com/dpressel/rude-carnie)

Age and Gender Classification using Convolutional Neural Networks(https://www.openu.ac.il/home/hassner/projects/cnn_agegender/)

[AgeGenderDeepLearning](https://github.com/GilLevi/AgeGenderDeepLearning)

[MTCNN](https://github.com/kpzhang93/MTCNN_face_detection_alignment)

