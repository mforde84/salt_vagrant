# salt_vagrant

Base configurations for a salt master / minion pair hosted locally 
using Virtualbox and Vagrant. 

Requirements:

    Virtualbox - currently tested version 5.2.18_Ubuntu r123745

    Virtualbox Guest Additions - currently tested v6.0.0 RC1 - 
        http://download.virtualbox.org/virtualbox/6.0.0_RC1/
        
    Vagrant - currently tested v2.2.4 - 
        https://www.vagrantup.com/downloads.html
  
	Host-only ethernet nic at 192.168.56.1/24 with DHCP enabled
	
To deploy:

    $ bash orka.sh # prompt < u / d > ( up or down )
    
To commit:

    $ bash commit.sh # prompt < comment >, < branch (default: master) > 
