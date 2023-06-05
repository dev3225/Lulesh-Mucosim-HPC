#!/bin/bash -l

###Job name
#SBATCH -J "lulesh_singlenode"

### File for output
#SBATCH --output=:


#SBATCH --nodes=1
#SBATCH --ntasks-per-node=64
#SBATCH --partition=singlenode
#SBATCH --time=2:00:00
#SBATCH --export=NONE
#SBATCH -C hwperf

export SLURM_EXPORT_ENV=ALL

###Load the requisite modules

module use ~unrz139/.modules/modulefiles
module load likwid/5.2.2-perf-nvmon
module load cmake
module load intel
module load intelmpi

###Run the application

likwid-mpirun -mpi slurm --mpiopts "--cpu-freq=2400000-2400000:performance" -np 64 -g MEM_DP -O ./BUILD/lulesh2.0 -p -b 0 –c 0 –s 60 –i 50
