#!bin/bash
####Juan Paolo Sicat
####J.A.Sicat@greenwich.ac.uk

#### Replace feature to TE classification (GFF files)
#### array file format
#### ClusterName#TEClass

# Variables
Library="~/bigdata/bedtest/MEDQ/MEDQresults.stdout"
readarray ID_LIST < MEDQ.headers

# Loop
for i in "${ID_LIST[@]}"
do
 echo "$i" > temp.out
 sed -i '/^$/d' temp.out
 awk -F "#" '{print $1"\42"}' temp.out > temp1.out
 variable=$(cat temp1.out)
 grep -w $variable ${Library} >> cleaned.MEDQ.out
 awk -F "#" '{print $2}' temp.out > temp2.out
 variable=$(cat temp2.out)
 sed -i "s~similarity~$variable~g" cleaned.MEDQ.out
done
