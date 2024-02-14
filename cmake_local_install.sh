
#how to install cmake on a cluster without root access

wget https://github.com/Kitware/CMake/releases/download/v3.21.3/cmake-3.21.3.tar.gz

tar -zxvf cmake-3.21.3.tar.gz
cd cmake-3.21.3
./bootstrap --prefix=/data/greenbaum/users/ahunos/apps
gmake

export PATH=/data/greenbaum/users/ahunos/apps/cmake-3.21.3/bin:$PATH
