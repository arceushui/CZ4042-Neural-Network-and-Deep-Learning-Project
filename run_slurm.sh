#!/bin/bash
#SBATCH --partition=SCSEGPU_UG
#SBATCH --gres=gpu:1
#SBATCH --qos=q_ug48
#SBATCH --time=4:00:00
#SBATCH --nodes=1
#SBATCH --mem=128G
#SBATCH --job-name=gender_class
#SBATCH --cpus-per-task=20
#SBATCH --output=example.out
#SBATCH --error=example.err

module load anaconda
module load cuda10.2
eval "$(conda shell.bash hook)"
conda activate /home/FYP/pang0208/.conda/envs/gender_classification

# insert shell script below
