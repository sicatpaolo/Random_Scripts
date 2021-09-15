#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=32
#SBATCH --mem=128G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sicat.paolo20@gmail.com
#SBATCH --cpus-per-task=1
#SBATCH --time=02:00:00
#SBATCH --output=oneMEDQ.stdout
#SBATCH --job-name="oneMEDQ"
#SBATCH -p short
##### Modules
module load bedtools/2.29.2

#### Variables
DIRSEQFILE="/rhome/seseal/bigdata/RepeatMasker/genomes/1.Q-type_B.tabaci.genome.fa"
NAME="MEDQ"

#### Code
# Obtain unique gene list gtf file (prevents duplicates)
sort /rhome/seseal/bigdata/bedtest/${NAME}/${NAME}.check.ANNOT.gtf | uniq > unique.${NAME}.check.ANNOT.gtf
sort /rhome/seseal/bigdata/bedtest/${NAME}/${NAME}.downstream.ANNOT.gtf | uniq > unique.${NAME}.downstream.ANNOT.gtf
sort /rhome/seseal/bigdata/bedtest/${NAME}/${NAME}.upstream.ANNOT.gtf | uniq > unique.${NAME}.upstream.ANNOT.gtf
sort /rhome/seseal/bigdata/bedtest/${NAME}/${NAME}.within.ANNOT.gtf | uniq > unique.${NAME}.within.ANNOT.gtf

# Change to set name properly
awk -v OFS='\t' '{print $1,$2,$9,$4,$5,$6,$7,$8,$9}' unique.${NAME}.check.ANNOT.gtf > getfasta.unique.${NAME}.check.ANNOT.gtf
awk -v OFS='\t' '{print $1,$2,$9,$4,$5,$6,$7,$8,$9}' unique.${NAME}.downstream.ANNOT.gtf > getfasta.unique.${NAME}.downstream.ANNOT.gtf
awk -v OFS='\t' '{print $1,$2,$9,$4,$5,$6,$7,$8,$9}' unique.${NAME}.upstream.ANNOT.gtf > getfasta.unique.${NAME}.upstream.ANNOT.gtf
awk -v OFS='\t' '{print $1,$2,$9,$4,$5,$6,$7,$8,$9}' unique.${NAME}.within.ANNOT.gtf > getfasta.unique.${NAME}.within.ANNOT.gtf

# Actual getting of fasta sequence
bedtools getfasta -name -fi ${DIRSEQFILE} -bed getfasta.unique.${NAME}.check.ANNOT.gtf -fo unique.${NAME}.check.ANNOT.fa
bedtools getfasta -name -fi ${DIRSEQFILE} -bed getfasta.unique.${NAME}.downstream.ANNOT.gtf -fo unique.${NAME}.downstream.ANNOT.fa
bedtools getfasta -name -fi ${DIRSEQFILE} -bed getfasta.unique.${NAME}.upstream.ANNOT.gtf -fo unique.${NAME}.upstream.ANNOT.fa
bedtools getfasta -name -fi ${DIRSEQFILE} -bed getfasta.unique.${NAME}.within.ANNOT.gtf -fo unique.${NAME}.within.ANNOT.fa
