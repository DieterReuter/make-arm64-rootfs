#!/bin/bash -e

UBUNTU_ARCH="arm64"
UBUNTU_RELEASE="15.10"
###IMAGE_FILE="ubuntu-${UBUNTU_RELEASE}-server-cloudimg-${UBUNTU_ARCH}-root.tar.gz"
IMAGE_FILE="ubuntu-core-${UBUNTU_RELEASE}-core-${UBUNTU_ARCH}.tar.gz"

# Download recent Ubuntu rootfs
if [ ! -f "${IMAGE_FILE}" ]; then
  ###wget -q "http://cloud-images.ubuntu.com/releases/${UBUNTU_RELEASE}/release/${IMAGE_FILE}"
  wget -q "http://cdimage.ubuntu.com/ubuntu-core/releases/${UBUNTU_RELEASE}/release/${IMAGE_FILE}"
fi

# Unpack the rootfs with user=root to keep the original file attributes
rm -fr ./rootfs
mkdir -p ./rootfs
tar -xzf ${IMAGE_FILE} -C ./rootfs/ || true

# Now change and add contents

# Pack the new rootfs as a compressed tarball
pushd ./rootfs
tar -czf ../rootfs.tar.gz * || true
popd

# Clean up
rm -fr ./rootfs

# Show infos
tar -tvf rootfs.tar.gz | head -25
pwd
ls -al

echo "OK"
