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
sudo rm -fr ./rootfs
mkdir -p ./rootfs
sudo tar -xzf ${IMAGE_FILE} -C ./rootfs/ || true

# Pack the new rootfs as a compressed tarball
pushd ./rootfs
sudo tar -czf ../rootfs.tar.gz * || true
popd

# Clean up
sudo rm -fr ./rootfs

# Show infos
tar -tvf rootfs.tar.gz | head -25
pwd
tree
ls -al
file *.tar.gz

echo "OK"
