#get all list of libraries used for my analyis

##step 1: clone github
#$cd /Users/ahunos/myWork/apps/methyl_longRead_wf
## step 2: get all the libraries used in the code

paths=/Users/ahunos/myWork/apps/methyl_longRead_wf/scripts/R/*.r
for path in $paths
do
  echo $path
  #grep "^library" $path
  grep "^library(".*")" $path | sed 's/#.*//' |sed 's/"//g' | sort | uniq | sed 's/library(//' | sed 's/)//' >> /Users/ahunos/myWork/apps/methyl_longRead_wf/scripts/R/libraries.txt
  #grep "^library" $path | awk '{print $2}' | sort | uniq
done

sort /Users/ahunos/myWork/apps/methyl_longRead_wf/scripts/R/libraries.txt | uniq > /Users/ahunos/myWork/apps/methyl_longRead_wf/scripts/R/libraries_uniq.txt
rm /Users/ahunos/myWork/apps/methyl_longRead_wf/scripts/R/libraries.txt

