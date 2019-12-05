#!/bin/bash
####Juan Paolo Sicat
####J.A.Sicat@greenwich.ac.uk

######Reads text file of WGS project ids i.e BAUK01
readarray Accession_list < Accession_ID.txt

######Goes through the loop
for WGSID in "${Accession_list[@]}"
do
  #Downloads the html page
  wget https://www.ncbi.nlm.nih.gov/Traces/wgs/?val=$WGSID
  #Grabs the organism name and removes the unnecessary parts
  organismname=$(grep "^<title>" index.* | sed 's/<title>//' | sed 's/:.*//')
  #Puts them into a text file (tab-delimited)
  echo -e "${organismname}\t$WGSID" >> WGSproject_to_organismname.txt
  #delete html file
  rm index.*
  #break
  sleep 1
done

#removes empty lines
sed -i '/^$/d' WGSproject_to_organismname.txt
