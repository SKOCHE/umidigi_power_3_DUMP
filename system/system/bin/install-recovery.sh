#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:cd24c73778e1a5d354c21530849b865b3efeadb3; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:e3ed0501f59dda67e9baddc2e99e7ec9f319015a \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:cd24c73778e1a5d354c21530849b865b3efeadb3 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
