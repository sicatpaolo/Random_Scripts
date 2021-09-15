### Random_Scripts
Scripts I made for random tasks

# R

clustering.r = parsing usearch results.

GenomeSizeCorrTEContent.r = Correlation of genome size and TE content. Statistical test and plotting.



# Bash

Multiple_scaffolds_into_one.sh = Replace headers with 100 Ns and turn them into one long scaffold.

WGSid_to_ORG.sh = Obtains a list of organism names based on WGS ids.

GFF_conversion.sh = Replaces feature with TEClass for gff files

```
# from
  tig00044410     RepeatMasker    similarity      7       66       8.5    -       .       Target "Motif:Cluster219" 29 89
# to
  tig00044410     AUGUSTUS        gene    467     2462    0.8     +       .       ID=g1;  tig00044410     RepeatMasker    DNA     7       66       8.5    -       .       Target "Motif:Cluster219" 29 89
```

getfasta.sh = Script to submit to cluster for converting gtf files to fasta. GTF files were output from RepeatMasker and BRAKER



# Python

BreadthFirstSearch.py = Breadth first search function learned from datacamp

# Excel Macro

MacroScale = Select Active cell and select an additional 70 cell below. Format the cells to show the highest value (Green) to lowest value (white)
