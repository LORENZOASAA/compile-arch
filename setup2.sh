pacman -S alsa-utils
pacman -S xorg-server xorg-xinit
	# togliere # per installre il desktop e usarlo 
	# I Desktop
	# GNOME pacman -S gnome gnome-extra gnome-initial-setup
	# KDE pacman -S plasma kde-applications xdg-user-dirs sddm
	# LXQt pacman -S lxqt breeze-icons sddm xdg-user-dirs
	# MATE pacman -S mate mate-extra xdg-user-dirs lightdm lightdm-gtk-greeter
	# Per GNOME systemctl enable gdm 
	# Per KDE e LXQt systemctl enable sddm
	# Per MATE systemctl enable lightdm 
pacman -S networkmanager
systemctl enable NetworkManager
systemctl disable dhcpcd
