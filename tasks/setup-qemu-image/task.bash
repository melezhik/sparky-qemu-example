set -e

mkdir -p ~/rocky-linux-distro

cd ~/rocky-linux-distro

distro_url=$(config distro_url)
download_distro=$(config download_distro)
if test $download_distro = "yes"; then
  echo "download distro from $distro_url"
  test -f distro.qcow2 || wget $distro_url -O distro.qcow2
fi

touch meta-data
cat << DATA > user-data
#cloud-config
users:
  - default
  - name: admin
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    lock_passwd: false
    plain_text_passwd: qwerty
    ssh_authorized_keys:
      ssh-rsa %key%
DATA
KEY=$(cat ~/.ssh/id_rsa.pub)
echo $KEY
sed -i -e 's/%key%/$KEY/' user-data

if test $os = "darwin"; then
  mkisofs -output /tmp/init.iso -volid cidata -joliet -rock user-data meta-data
else
  genisoimage -output /tmp/init.iso -V cidata -r -J user-data meta-data
fi

ls -l /tmp/init.iso
