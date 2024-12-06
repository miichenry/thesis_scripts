#!/bin/bash
#SBATCH --mail-type=END,FAIL
#SBATCH --output=%x_%j.out
#SBATCH --partition=public-bigmem
#SBATCH --time=8:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5

ml Anaconda3
. ~/jupyecke/noisepy/stacks2numpy_venv/bin/activate
echo "******["`date +%Y-%m-%d_%H:%M:%S`"]******"
python stacks2numpy_options.py -c ZZ -f 01 -s 001 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 01 -s 001 -p CH_BALST_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 01 -s 001 -p CH_BALST_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 01 -s 001 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 01 -s 001 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 01 -s 001 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 01 -s 002 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 01 -s 002 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 01 -s 002 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 01 -s 002 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 01 -s 002 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 01 -s 002 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 01 -s 003 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 01 -s 003 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 01 -s 003 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 01 -s 003 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 01 -s 003 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 01 -s 003 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 01 -s 004 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 01 -s 004 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 01 -s 004 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 01 -s 004 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 01 -s 004 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 01 -s 004 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 01 -s 005 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 01 -s 005 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 01 -s 005 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 01 -s 005 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 01 -s 005 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 01 -s 005 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 01 -s 006 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 01 -s 006 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 01 -s 006 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 01 -s 006 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 01 -s 006 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 01 -s 006 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 01 -s 007 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 01 -s 007 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 01 -s 007 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 01 -s 007 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 01 -s 007 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 01 -s 007 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 02 -s 001 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 02 -s 001 -p CH_BALST_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 02 -s 001 -p CH_BALST_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 02 -s 001 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 02 -s 001 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 02 -s 001 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 02 -s 002 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 02 -s 002 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 02 -s 002 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 02 -s 002 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 02 -s 002 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 02 -s 002 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 02 -s 003 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 02 -s 003 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 02 -s 003 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 02 -s 003 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 02 -s 003 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 02 -s 003 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 02 -s 004 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 02 -s 004 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 02 -s 004 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 02 -s 004 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 02 -s 004 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 02 -s 004 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 02 -s 005 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 02 -s 005 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 02 -s 005 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 02 -s 005 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 02 -s 005 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 02 -s 005 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 02 -s 006 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 02 -s 006 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 02 -s 006 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 02 -s 006 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 02 -s 006 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 02 -s 006 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 02 -s 007 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 02 -s 007 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 02 -s 007 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 02 -s 007 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 02 -s 007 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 02 -s 007 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 03 -s 001 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 03 -s 001 -p CH_BALST_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 03 -s 001 -p CH_BALST_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 03 -s 001 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 03 -s 001 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 03 -s 001 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 03 -s 002 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 03 -s 002 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 03 -s 002 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 03 -s 002 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 03 -s 002 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 03 -s 002 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 03 -s 003 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 03 -s 003 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 03 -s 003 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 03 -s 003 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 03 -s 003 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 03 -s 003 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 03 -s 004 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 03 -s 004 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 03 -s 004 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 03 -s 004 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 03 -s 004 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 03 -s 004 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 03 -s 005 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 03 -s 005 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 03 -s 005 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 03 -s 005 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 03 -s 005 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 03 -s 005 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 03 -s 006 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 03 -s 006 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 03 -s 006 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 03 -s 006 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 03 -s 006 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 03 -s 006 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 03 -s 007 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 03 -s 007 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 03 -s 007 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 03 -s 007 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 03 -s 007 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 03 -s 007 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 04 -s 001 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 04 -s 001 -p CH_BALST_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 04 -s 001 -p CH_BALST_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 04 -s 001 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 04 -s 001 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 04 -s 001 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 04 -s 002 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 04 -s 002 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 04 -s 002 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 04 -s 002 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 04 -s 002 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 04 -s 002 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 04 -s 003 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 04 -s 003 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 04 -s 003 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 04 -s 003 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 04 -s 003 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 04 -s 003 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 04 -s 004 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 04 -s 004 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 04 -s 004 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 04 -s 004 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 04 -s 004 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 04 -s 004 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 04 -s 005 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 04 -s 005 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 04 -s 005 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 04 -s 005 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 04 -s 005 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 04 -s 005 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 04 -s 006 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 04 -s 006 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 04 -s 006 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 04 -s 006 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 04 -s 006 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 04 -s 006 -p CH_MTI02_CH_SAIRA

python stacks2numpy_options.py -c ZZ -f 04 -s 007 -p CH_BALST_CH_BOURR
python stacks2numpy_options.py -c ZZ -f 04 -s 007 -p CH_BALST_CH_MTI02 
python stacks2numpy_options.py -c ZZ -f 04 -s 007 -p CH_BALST_CH_SAIRA 
python stacks2numpy_options.py -c ZZ -f 04 -s 007 -p CH_BOURR_CH_MTI02
python stacks2numpy_options.py -c ZZ -f 04 -s 007 -p CH_BOURR_CH_SAIRA
python stacks2numpy_options.py -c ZZ -f 04 -s 007 -p CH_MTI02_CH_SAIRA

echo "******["`date +%Y-%m-%d_%H:%M:%S`"]******"
