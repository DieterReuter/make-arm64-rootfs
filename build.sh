#!/bin/bash -e
set -x 

uname -a

UBUNTU_ARCH="arm64"
UBUNTU_RELEASE="15.10"
IMAGE_FILE="ubuntu-${UBUNTU_RELEASE}-server-cloudimg-${UBUNTU_ARCH}-root.tar.gz"

# Download recent Cloud rootfs
if [ ! -f "${IMAGE_FILE}" ]; then
  wget "http://cloud-images.ubuntu.com/releases/${UBUNTU_RELEASE}/release/${IMAGE_FILE}"
fi

# Unpack the rootfs with user=root to keep the original file attributes
mkdir -p ./rootfs
sudo tar xfz ${IMAGE_FILE} -C ./rootfs || true

# Pack the new rootfs as a compressed tarball
sudo tar cfz ./rootfs.tar.gz -C ./rootfs || true

# Clean up
sudo rm -fr ./rootfs

# Show infos
pwd
tree
ls -al
file *.tar.gz

echo "OK"
