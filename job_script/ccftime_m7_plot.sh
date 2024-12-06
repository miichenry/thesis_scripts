#!/bin/bash
#SBATCH --output=%x_%j.out
#SBATCH --partition=public-short-cpu
#SBATCH --time=1:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2

ml GCC/11.3.0  OpenMPI/4.1.4 intel-compilers/2022.1.0  impi/2021.6.0 SciPy-bundle/2022.05
. ~/msnoise_venv/bin/activate
cd ${SLURM_SUBMIT_DIR}
echo "${SLURM_SUBMIT_DIR}"
echo "******["`date +%Y-%m-%d_%H:%M:%S`"]******"
msnoise plot ccftime CH.BALST CH.BOURR -m 7 -f 1 -o ?.png
msnoise plot ccftime CH.BALST CH.MTI02 -m 7 -f 1 -o ?.png
msnoise plot ccftime CH.BALST CH.SAIRA -m 7 -f 1 -o ?.png
msnoise plot ccftime CH.BOURR CH.MTI02 -m 7 -f 1 -o ?.png
msnoise plot ccftime CH.BOURR CH.SAIRA -m 7 -f 1 -o ?.png
msnoise plot ccftime CH.MTI02 CH.SAIRA -m 7 -f 1 -o ?.png

msnoise plot ccftime CH.BALST CH.BOURR -m 7 -f 2 -o ?.png
msnoise plot ccftime CH.BALST CH.MTI02 -m 7 -f 2 -o ?.png
msnoise plot ccftime CH.BALST CH.SAIRA -m 7 -f 2 -o ?.png
msnoise plot ccftime CH.BOURR CH.MTI02 -m 7 -f 2 -o ?.png
msnoise plot ccftime CH.BOURR CH.SAIRA -m 7 -f 2 -o ?.png
msnoise plot ccftime CH.MTI02 CH.SAIRA -m 7 -f 2 -o ?.png

msnoise plot ccftime CH.BALST CH.BOURR -m 7 -f 3 -o ?.png
msnoise plot ccftime CH.BALST CH.MTI02 -m 7 -f 3 -o ?.png
msnoise plot ccftime CH.BALST CH.SAIRA -m 7 -f 3 -o ?.png
msnoise plot ccftime CH.BOURR CH.MTI02 -m 7 -f 3 -o ?.png
msnoise plot ccftime CH.BOURR CH.SAIRA -m 7 -f 3 -o ?.png
msnoise plot ccftime CH.MTI02 CH.SAIRA -m 7 -f 3 -o ?.png

msnoise plot ccftime CH.BALST CH.BOURR -m 7 -f 4 -o ?.png
msnoise plot ccftime CH.BALST CH.MTI02 -m 7 -f 4 -o ?.png
msnoise plot ccftime CH.BALST CH.SAIRA -m 7 -f 4 -o ?.png
msnoise plot ccftime CH.BOURR CH.MTI02 -m 7 -f 4 -o ?.png
msnoise plot ccftime CH.BOURR CH.SAIRA -m 7 -f 4 -o ?.png
msnoise plot ccftime CH.MTI02 CH.SAIRA -m 7 -f 4 -o ?.png

msnoise plot ccftime CH.BALST CH.BOURR -m 7 -f 5 -o ?.png
msnoise plot ccftime CH.BALST CH.MTI02 -m 7 -f 5 -o ?.png
msnoise plot ccftime CH.BALST CH.SAIRA -m 7 -f 5 -o ?.png
msnoise plot ccftime CH.BOURR CH.MTI02 -m 7 -f 5 -o ?.png
msnoise plot ccftime CH.BOURR CH.SAIRA -m 7 -f 5 -o ?.png
msnoise plot ccftime CH.MTI02 CH.SAIRA -m 7 -f 5 -o ?.png

msnoise plot ccftime CH.BALST CH.BOURR -m 7 -f 6 -o ?.png
msnoise plot ccftime CH.BALST CH.MTI02 -m 7 -f 6 -o ?.png
msnoise plot ccftime CH.BALST CH.SAIRA -m 7 -f 6 -o ?.png
msnoise plot ccftime CH.BOURR CH.MTI02 -m 7 -f 6 -o ?.png
msnoise plot ccftime CH.BOURR CH.SAIRA -m 7 -f 6 -o ?.png
msnoise plot ccftime CH.MTI02 CH.SAIRA -m 7 -f 6 -o ?.png

msnoise plot ccftime CH.BALST CH.BOURR -m 7 -f 7 -o ?.png
msnoise plot ccftime CH.BALST CH.MTI02 -m 7 -f 7 -o ?.png
msnoise plot ccftime CH.BALST CH.SAIRA -m 7 -f 7 -o ?.png
msnoise plot ccftime CH.BOURR CH.MTI02 -m 7 -f 7 -o ?.png
msnoise plot ccftime CH.BOURR CH.SAIRA -m 7 -f 7 -o ?.png
msnoise plot ccftime CH.MTI02 CH.SAIRA -m 7 -f 7 -o ?.png
echo "******["`date +%Y-%m-%d_%H:%M:%S`"]******"
