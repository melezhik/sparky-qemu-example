# sparky-qemu-example

Example of running qemu boxes under Sparky

# Install

1. Prepare image to test

```
mkdir -p ~/rocky-linux-distro
cd rocky-linux-distro 
wget https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud-Base-9.5-20241118.0.x86_64.qcow2 -O distro.qcow2
```

2. Copy sparky job

```
git clone https://github.com/melezhik/sparky-qemu-example.git 
cp -r .sparky/projects/ ~/.sparky/projects/
```

3. Go to sparky - http://127.0.0.1:4000 and run sparky-qemu-example job

# Example

![rocky](images/rocky.jpeg)
