#!/bin/bash
####Juan Paolo Sicat
####J.A.Sicat@greenwich.ac.uk
#Variables
ASSEMBLYNAME="ANY"
ASSEMBLYLOCATION="/your/file/path/"
ASSEMBLYFILE="yourfile.fna"
#Replaces headers with 100 N
sed 's/^>.*/NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN/g' ${ASSEMBLYLOCATION}${ASSEMBLYFILE} > out.fa
#Turns them into one line
tr -d '\n' < out.fa > ${ASSEMBLYNAME}out.fa
#Counts Nucleotides
grep -o -E 'A|T|C|G|N|-' ${ASSEMBLYNAME}out.fa | sort | uniq -c > 1.txt
#Counts nucleotides from original file to compare them with output
sed 's/^>.*/NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN/g' ${ASSEMBLYLOCATION}${ASSEMBLYFILE} | grep -o -E 'A|T|C|G|N|-' | sort | uniq -c > 2.txt
#Creates a header
echo ">${ASSEMBLYNAME}" > header.fa
#Creates the final file
cat header.fa ${ASSEMBLYNAME}out.fa > ${ASSEMBLYNAME}final.fa


#Cleanup
rm header.fa
