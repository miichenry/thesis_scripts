#!/bin/bash
#SBATCH --output=%x_%j.out
#SBATCH --partition=public-short-cpu
#SBATCH --time=1:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2

ml Anaconda3
. ~/jupyecke/noisepy/stacks2numpy_venv/bin/activate
cd ${SLURM_SUBMIT_DIR}
echo "${SLURM_SUBMIT_DIR}"
echo "******["`date +%Y-%m-%d_%H:%M:%S`"]******"
python stacks2numpy_options.py -c ZZ -f 01 -s 007 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 01 -s 007 -p CH_BALST_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 01 -s 007 -p CH_BALST_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 01 -s 007 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 01 -s 007 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 01 -s 007 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 01 -s 014 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 01 -s 014 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 01 -s 014 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 01 -s 014 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 01 -s 014 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 01 -s 014 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 01 -s 021 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 01 -s 021 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 01 -s 021 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 01 -s 021 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 01 -s 021 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 01 -s 021 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 01 -s 028 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 01 -s 028 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 01 -s 028 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 01 -s 028 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 01 -s 028 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 01 -s 028 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 01 -s 035 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 01 -s 035 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 01 -s 035 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 01 -s 035 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 01 -s 035 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 01 -s 035 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 01 -s 042 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 01 -s 042 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 01 -s 042 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 01 -s 042 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 01 -s 042 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 01 -s 042 -p CH_MTI02_CH_SAIRA
echo "******["`date +%Y-%m-%d_%H:%M:%S`"]******"
