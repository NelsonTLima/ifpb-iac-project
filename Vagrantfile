# vi: set ft=ruby

Vagrant.configure("2") do |config|

  # p01-nelson Configurations.
  config.vm.define "p01-nelson" do |nelson|
    nelson.vm.box = "debian/bookworm64"
    nelson.vm.network "private_network", ip: "192.168.57.10"
    nelson.vm.network "public_network", bridge: "wlp3s0"

    # Vm configurations in virtualbox.
    nelson.vm.provider "virtualbox" do |vb|
      vb.name = "p01-nelson"
      vb.gui = false
      vb.memory = "1024"
    end

    # Explicitly creates the primary disk ensuring it will always be sda
    nelson.vm.disk :disk, size: "30GB", name: "disk-#{0}", primary: true

    # Setting 3 extra disks with 10GB each.
    (1..3).each do |i|
      nelson.vm.disk :disk, size: "10GB", name: "disk-#{i}"
    end

  end
  # End of p01-nelson configuraitons

  # Running ansible from the Vagrant Host.
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yaml"
    ansible.compatibility_mode = "2.0"
  end

end
