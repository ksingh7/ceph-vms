Vagrant.require_version ">= 1.4.3"
VAGRANTFILE_API_VERSION = "2"

BOX='centos7-standard'
BOX_URL='https://www.dropbox.com/s/hiarmp3cdzjy94o/centos7-standard.box?dl=1'

CLIENT_NODE='ubuntu/trusty64'

node1= 'node1'
node1_disk2 = './node1/node1_disk2.vdi'
node1_disk3 = './node1/node1_disk3.vdi'
node1_disk4 = './node1/node1_disk4.vdi'

node2= 'node2'
node2_disk2 = './node2/node2_disk2.vdi'
node2_disk3 = './node2/node2_disk3.vdi'
node2_disk4 = './node2/node2_disk4.vdi'

node3= 'node3'
node3_disk2 = './node3/node3_disk2.vdi'
node3_disk3 = './node3/node3_disk3.vdi'
node3_disk4 = './node3/node3_disk4.vdi'

client_node= 'client1'

rgw_hostname= 'rgw.homelab.com'
rgw_machine_name= 'rgw'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

##################################### Configuration for node1 #####################################################

                 config.vm.define :"node1" do |node1|
                        node1.vm.box = BOX
                        node1.vm.box_url = BOX_URL
                        node1.vm.network :private_network, ip: "192.168.100.101"
                        node1.vm.hostname = node1
                        node1.vm.synced_folder ".", "/vagrant", disabled: true
			node1.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
                        node1.vm.provision "shell", path: "post-deploy.sh" ,run: "always"
                        node1.vm.provider "virtualbox" do |v|

                                v.customize ["modifyvm", :id, "--memory", "750"]
                                v.name = node1
				v.gui = true

                                unless File.exist?(node1_disk2)
                                v.customize ['createhd', '--filename', node1_disk2, '--size', 1 * 20480]
                                v.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', node1_disk2]
                                end

                                unless File.exist?(node1_disk3)
                                v.customize ['createhd', '--filename', node1_disk3,'--size', 1 * 20480]
                                v.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', node1_disk3]
                                end

                                unless File.exist?(node1_disk4)
                                v.customize ['createhd', '--filename', node1_disk4,'--size', 1 * 20480]
                                v.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', node1_disk4]
                                end

                        end

                end


##################################### Configuration for node2 #####################################################

 		config.vm.define :"node2" do |node2|
                        node2.vm.box = BOX
                        node2.vm.box_url = BOX_URL
                        node2.vm.network :private_network, ip: "192.168.100.102"
                        node2.vm.hostname = node2
                        node2.vm.synced_folder ".", "/vagrant", disabled: true
			node2.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
                        node2.vm.provision "shell", path: "post-deploy.sh",run: "always"
                        node2.vm.provider "virtualbox" do |v|

                                v.customize ["modifyvm", :id, "--memory", "750"]
                                v.name = node2
				v.gui = true

                                unless File.exist?(node2_disk2)
                                v.customize ['createhd', '--filename', node2_disk2,'--size', 1 * 20480]
                                v.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', node2_disk2]
                                end

                                unless File.exist?(node2_disk3)
                                v.customize ['createhd', '--filename', node2_disk3,'--size', 1 * 20480]
                                v.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', node2_disk3]
                                end

                                unless File.exist?(node2_disk4)
                                v.customize ['createhd', '--filename', node2_disk4,'--size', 1 * 20480]
                                v.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', node2_disk4]
                                end

                        end

                end

##################################### Configuration for node3 #####################################################

                config.vm.define :"node3" do |node3|
                        node3.vm.box = BOX
                        node3.vm.box_url = BOX_URL
                        node3.vm.network :private_network, ip: "192.168.100.103"
                        node3.vm.hostname = node3
                        node3.vm.synced_folder ".", "/vagrant", disabled: true
			node3.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
                        node3.vm.provision "shell", path: "post-deploy.sh",run: "always"
                        node3.vm.provider "virtualbox" do |v|

                                v.customize ["modifyvm", :id, "--memory", "750"]
                                v.name = node3
                                v.gui = true

                                unless File.exist?(node3_disk2)
                                v.customize ['createhd', '--filename', node3_disk2,'--size', 1 * 20480]
                                v.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', node3_disk2]
                                end

                                unless File.exist?(node3_disk3)
                                v.customize ['createhd', '--filename', node3_disk3,'--size', 1 * 20480]
                                v.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', node3_disk3]
                                end

                                unless File.exist?(node3_disk4)
                                v.customize ['createhd', '--filename', node3_disk4,'--size', 1 * 20480]
                                v.customize ['storageattach', :id,  '--storagectl', 'SATA', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', node3_disk4]
                                end

                        end

                end


##################################### Configuration for client node #####################################################

                 config.vm.define :"client1" do |os|
                        os.vm.box = CLIENT_NODE
                        os.vm.network :private_network, ip: "192.168.100.110"
                        os.vm.hostname = client_node
                        os.vm.synced_folder ".", "/vagrant", disabled: true
			os.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
			os.vm.provision "shell", path: "post-deploy.sh"
                        os.vm.provider "virtualbox" do |v|

                                v.customize ["modifyvm", :id, "--memory", "512"]
                                v.name = client_node
                                v.gui = true

                        end
                  end

##################################### Configuration for rgw #####################################################

                 config.vm.define :"rgw" do |rgw|
                        rgw.vm.box = BOX
                        rgw.vm.box_url = BOX_URL
                        rgw.vm.network :private_network, ip: "192.168.100.106"
                        rgw.vm.hostname = rgw_hostname
                        rgw.vm.synced_folder ".", "/vagrant", disabled: true
                        rgw.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
                        rgw.vm.provision "shell", path: "post-deploy.sh",run: "always"
                        rgw.vm.provider "virtualbox" do |v|

                                v.customize ["modifyvm", :id, "--memory", "512"]
                                v.name = rgw_machine_name
                                v.gui = true

                        end
                  end


###############################################################################################################
end
