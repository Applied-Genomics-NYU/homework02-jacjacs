#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --time=1:00:00
#SBATCH --mem=8GB
#SBATCH --job-name=MYJOB
#SBATCH --output=slurm_%j.out

module load hisat2/intel/2.0.5
hisat2-build ./Arabidopsis.fa index_arabidopsis
for read in ./*_1.fastq
do
 	hisat2 -p 8 -x index_arabidopsis -1 $read -2 ${read::-7}2.fastq -S ${read::-7}arabidopsis.sam
done



 

