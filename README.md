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
cp /mnt/etc/nixos/hardware-configuration.nix ./hosts/${HOST}/hardware-configuration.nix
```

### Install NixOS

```{bash}
nixos-install --flake /full/path/to/flake-root#${HOST}
```

For example, if you cloned this repo to `/root` in the NixOS installer and you want to install nix on a host
named `nixbox`, you would run:

```{bash}
nixos-install --flake /root/nixos#nixbox
```

> **Note**: You will be prompted to set up a root password once the installation has completed. If you have defined a
> user account in your `configuration.nix` file, you'll need to set a password before rebooting by running:

```{bash}
nixos-enter --root /mnt -c 'passwd peter'
```

### Updating NixOS

After installing NixOS, clone this repo to `/etc/nixos`. Whenever you make changes to the configuration, to apply them
you can run:

```{bash}
sudo nixos-rebuild switch --flake /etc/nixos#nixbox
```
