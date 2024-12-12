#!/bin/bash
#
#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno01/lab3/lab-git 
#SBATCH -J submit_lab3-file-cut
#SBATCH --output=alumno01-%j.out
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1

# Lista de archivos .fastq
input_folder="/home/alumno01/lab3/lab-git/fastqc" 
files=($input_folder/*.fastq)

# Lanzar cada tarea para un archivo específico
for i in {0..3}; do
	srun -n 1 bash /home/alumno01/lab3/lab-git/file-cut.sh "${files[$i]}" & 
done
wait


