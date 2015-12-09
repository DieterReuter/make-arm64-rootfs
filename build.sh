#!/bin/bash -e

UBUNTU_ARCH="arm64"
UBUNTU_RELEASE="15.10"
IMAGE_FILE="ubuntu-${UBUNTU_RELEASE}-server-cloudimg-${UBUNTU_ARCH}-root.tar.xz"

wget "http://cloud-images.ubuntu.com/releases/${UBUNTU_RELEASE}/release/${IMAGE_FILE}"
tar vtfz ${IMAGE_FILE}

echo "OK"
