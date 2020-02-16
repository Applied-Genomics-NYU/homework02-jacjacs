#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --time=1:00:00
#SBATCH --mem=8GB
#SBATCH --job-name=MYJOB
#SBATCH --output=slurm_%j.out

module load salmon/1.0.0
salmon index -t athal.fa.gz -i anthal_index
for read in ./*_1.fastq
do
	salmon quant -i anthal_index -l A -1 $read -2 ${read::-7}2.fastq -p 8 --validateMappings -o quants/leaf
done
