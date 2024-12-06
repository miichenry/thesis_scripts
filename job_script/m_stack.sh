#!/bin/bash
#SBATCH --mail-type=END,FAIL
#SBATCH --output=%x_%j.out
#SBATCH --partition=public-short-cpu
#SBATCH --time=1:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5
#SBATCH --mem-per-cpu=4000 # in MB

ml GCC/11.3.0  OpenMPI/4.1.4 intel-compilers/2022.1.0  impi/2021.6.0 SciPy-bundle/2022.05
. ~/msnoise_venv/bin/activate
cd ${SLURM_SUBMIT_DIR}
echo "${SLURM_SUBMIT_DIR}"
msnoise -t 5 stack -m
echo  "MOV stack done"

