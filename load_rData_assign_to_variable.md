# load Rdata and assign specific objects within it to a variable 

1. create a separate environemnt
2. load rdata in that environ
3. pull the specific file you need from that environemnt to your current environ

```
#create new environment
new_env <- new.env()
# Load the .rda file into the new environment
path_promoter_file <- "/juno/work/greenbaum/users/ahunos/apps/methylONT/data/gene_promoters_encode1kb_mm10_proteinCoding.rda"

load(path_promoter_file, envir = new_env)
# Assign the object to a new variable
gene_promoters_encode1kb <- new_env[[ls(new_env)]]
```