vagrant.configured("2") do |config|
    config.vm.box = "centos/7"
    config.vm.network "private_network", ip:"192.168.56.33"
    config.vm.network "public_network"
    config.vm.synced_folder "../data", "vagrant"
    config.vm.provider "virtualbox" do |vb|
        vb.mempory ="1024"
    end
    config.vm.provision "shell", inline <<-SHELL
        yum  install httpd wget unzip zip -y
        systemctl start httpd
        systemctl enable httpd
        cd /tmp; wget https://www.tooplate.com/download/2135_mini_finance ; unzip 2135_mini_finance.zip ;cd 2135_mini_finance ; cp -r * /var/www/html
end
