#script duranate l'installzione
#è un commento è normale che dopo avere scelto per sempio il nome va tloto #
loadkeys it
ls /sys/firmware/efi/efivars
ip link
dhcpcd
ping www.google.com
iwctl device list
iwctl station interface scan
iwctl station interface get-networks
iwctl station interface connect SSID
fdisk -l
cfdisk /dev/ # partizione (sda?)
	# cfdisk /dev/percorso disco.
	# Crare una partizione UEFI.
	# Andare su NEW e usare un minimo di 512M.
	# Andare su TYPE e cercare EFI System.
	# Crare una partizione SWAP.
	# Andare su NEW e usare un minimo di 4G.
	# Andare su TYPE e cercare Linux swap.
	# Crare una partizione ROOT.
	# Andare su NEW e usare tutto lo spazio rimante.
	# Andare su TYPE e cercare Linux filesystem.
	# fare un fdisk -l per vedere tutte le partizioni 
mkfs.vfat -F32 /dev/ # mettere la partizione dell EFI.
	# La partizione UEFI quella con un minimo di 512M
mkfs.ext4 /dev/ # mettere la partizione della ROOT.
	# La partizione ROOT quella con tutto lo spazio
mkswap /dev/ # mettere la partizione SWAP
	# La partizione SWAP quealla con un minimo di 4G.
mount /dev/ROOT /mnt
	# La partizione ROOT quella con tutto lo spazio
mkdir -p /mnt/boot/efi
mount /dev/EFI /mnt/boot/efi
	# La partizione UEFI quella con un minimo di 512M
swapon /dev/SWAP
	# La partizione SWAP quealla con un minimo di 4G.
reflector --verbose --country Italy --sort rate --save /etc/pacman.d/mirrorlist
cat /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel linux linux-firmware nano
genfstab -U -p /mnt > /mnt/etc/fstab
arch-chroot /mnt /bin/bash
nano /etc/locale.gen
	# decommentare (togliere #) it_IT.UTF-8 infine Premiamo CTRL + O per salvare, poi INVIO e infine CTRL + X.
locale-gen
echo LANG=it_IT.UTF-8 > /etc/locale.conf
export LANG=it_IT.UTF-8
nano /etc/vconsole.conf
	# scriviamo al suo interno
		# KEYMAP=it
        # EDITOR=nano
	# infine Premiamo CTRL + O per salvare, poi INVIO e infine CTRL + X.
export EDITOR=nano
ln -s /usr/share/zoneinfo/Europe/Rome /etc/localtime
hwclock --systohc --utc
echo NomeMacchina > /etc/hostname
pacman -S net-tools dhcpcd netctl
systemctl enable dhcpcd
pacman -S iwd wpa_supplicant wireless_tools dialog iw
systemctl enable iwd
passwd
useradd -m -G wheel -s /bin/bash #nomeutente
passwd #nomeutente
visudo
pacman -S grub
pacman -S efibootmgr 
pacman -S os-prober
grub-install
grub-install #/percorso/Disco
grub-mkconfig -o /boot/grub/grub.cfg
exit
reboot
