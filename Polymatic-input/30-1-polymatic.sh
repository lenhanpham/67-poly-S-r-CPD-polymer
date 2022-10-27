#!/bin/bash
#PBS -P ft56 
#PBS -q normal 
#PBS -l ncpus=20 
#PBS -l mem=80GB 
#PBS -l software=lammps 
#PBS -l jobfs=398GB 
#PBS -l walltime=24:00:00
#PBS -l wd
#PBS -l storage=scratch/ft56+gdata/ft56  


currdir=$(pwd) 
module load lammps/3Aug2022  

module load python2/2.7.17 

rm -rf $currdir/data.lmps $currdir/temp.lmps $currdir/step_* 


chmod 700 pack.pl 
n=30
./pack.pl -i 1 1monomer-vmd.lmps $n -l 80 -o data.lmps 


python2 polym_loop.py 

mv final.lmps $n-polymer.lmps 

