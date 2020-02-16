#!/bin/bash
module load samtools/intel/1.9
for read in ./*.sam
do
samtools view -bS $read > ${read::-3}bam
done
