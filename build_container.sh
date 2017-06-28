sudo rm -f xdmod.img
sudo singularity create xdmod.img
sudo singularity expand --size 8192 xdmod.img
sudo singularity import xdmod.img docker://centos:7
sudo singularity exec -B `pwd`:/mnt -w xdmod.img sh /mnt/install_xdmod.sh
