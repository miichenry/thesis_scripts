#!/bin/sh
#SBATCH --output=%x_%j.out
#SBATCH --partition=shared-cpu
#SBATCH --cpus-per-task=3
#SBATCH --ntasks=1
#SBATCH --mem=10g
#SBATCH --time=12:00:00

ml Anaconda3
source /opt/ebsofts/Anaconda3/2022.05/etc/profile.d/conda.sh
conda activate get_mseed

echo "******["`date +%Y-%m-%d_%H:%M:%S`"]******"
python mseed2.0_scripts/get_MOUTI_MSEEDdat.py
echo "******["`date +%Y-%m-%d_%H:%M:%S`"]******"
