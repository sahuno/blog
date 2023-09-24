setting R libraries on hpc

1. create a folder to hold your librries 
mkdir -p /lila/data/greenbaum/users/ahunos/apps/Rlibs

2. export
<!-- export R_LIBS_USER=/lila/data/greenbaum/users/ahunos/apps/Rlibs -->
echo $R_LIBS_USER
export R_LIBS_USER=/lila/home/ahunos/R/x86_64-pc-linux-gnu-library/4.2

this will make the userLibrary the first place to put new packages:
.libPaths( c("/lila/home/ahunos/R/x86_64-pc-linux-gnu-library/4.2" , .libPaths() ) )