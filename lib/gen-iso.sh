function gen_manifest {
	chmod +w extract-cd/casper/filesystem.manifest
	sudo chroot edit dpkg-query -W --showformat='${Package} ${Version}\n' > extract-cd/casper/filesystem.manifest
	sudo cp extract-cd/casper/filesystem.manifest extract-cd/casper/filesystem.manifest-desktop
	sudo sed -i '/ubiquity/d' extract-cd/casper/filesystem.manifest-desktop
	sudo sed -i '/casper/d' extract-cd/casper/filesystem.manifest-desktop
}

function gen_squashfs {
	sudo rm extract-cd/casper/filesystem.squashfs
	sudo mksquashfs edit extract-cd/casper/filesystem.squashfs
}

function change_default_locale {
	_PWD="$(pwd)"
	cd gfxboot-theme-ubuntu
	make DEFAULT_LANG=vi
	cp -R install/* ../extract-cd/isolinux/
	cd $_PWD
}

function gen_iso {
	_PWD="$(pwd)"

	cp lib/README.diskdefines extract-cd/README.diskdefines
	cd extract-cd
	sudo sed -i 's/elementary OS/Gokien/g' isolinux/txt.cfg
	find -type f -print0 | sudo xargs -0 sha256sum | grep -v isolinux/boot.cat | sudo tee SHA256SUMS

	sudo mkisofs -D -r -V "$IMAGE_NAME" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o ../gokien.iso .
	
	sudo isohybrid ../gokien.iso

	cd $_PWD
}
