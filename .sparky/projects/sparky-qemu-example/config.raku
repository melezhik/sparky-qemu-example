%(
  distro_url => "https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud-Base-9.5-20241118.0.x86_64.qcow2",
  repo => "https://github.com/melezhik/sparky-qemu-example.git",
  branch => "main",
  download_distro => False,
  qemu-binary => "qemu-kvm",
)
