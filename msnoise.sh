#!/bin/bash

dir="/home/users/h/henrymi2/jupyecke"

ml GCC/11.3.0  OpenMPI/4.1.4 intel-compilers/2022.1.0  impi/2021.6.0 SciPy-bundle/2022.05 Tkinter/3.10.4
source ~/msnoise_venv/bin/activate
cd "$dir"
