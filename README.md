# NixOS Config Files

## Installation

### Configure disk partitioning

Use the [disko](https://github.com/nix-community/disko/blob/master/docs/quickstart.md) tool to configure the disk
partitioning by running:

```{bash}
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./hosts/${HOST}/disko.nix
```

Then, to verify, you can run any or all of the following commands:

```{bash}
mount | grep /mnt
```

```{bash}
sudo fdisk -l /dev/sda
```

```{bash}
sudo fdisk -l /dev/sda
```

```{bash}
sudo cryptsetup status crypted
```

```{bash}
sudo btrfs subvolume list /mnt
```

```{bash}
ls -la /mnt
```

### Generate hardware configuration

```{bash}
nixos-generate-config --no-filesystems --root /mnt
```

And then copy that generated file to your target host path:

```{bash}
cp /etc/nixos/hardware-configuration.nix ./hosts/${HOST}/hardware-configuration.nix
```

### Install NixOS

```{bash}
nixos-install --flake /full/path/to/flake-root#${HOST}
```

For example, if you cloned this repo to `/root/home/` in the NixOS installer and you want to install nix on a host
named `myhost`, you would run:

```{bash}
nixos-install --flake /root/home/nixos#myhost
```
