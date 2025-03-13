#!/bin/bash
#SBATCH -J ml-co
#SBATCH -o ./%x.%j.%N.out
#SBATCH -D ./
#SBATCH --get-user-env
#SBATCH --mail-user=ansgar.schubert@tum.de
#SBATCH --mail-type=end
#SBATCH --clusters=serial
#SBATCH --partition=serial_std
#SBATCH --cpus-per-task=8
#SBATCH --export=NONE
#SBATCH --time=05:00:00

module load slurm_setup

python run_training.py --oracle_solutions_directory=${DIR_ORACLE} --dir_models=${DIR_MODELS} --num_perturbations=${NUM_PERTURBATIONS} --sd_perturbation=${SD_PERTURBATION} --time_limit=${TIME_LIMIT} --learning_rate=${LEARNING_RATE} --predictor=${PREDICTOR} --feature_set=${FEATURE_SET}
