

#### Run the start script:

    bash ./scripts/start.sh


#### Configure your git SSH keyPair:

- Follow this steps to create one keyPair (if you dont have one yet): https://www.ssh.com/ssh/keygen/
    
- Copy the public key generated and configure it in your git repositories.

    cat ~/.ssh/id_rsa.pub

#### Add some tricks into visudo

To be allowed to run some very useful development tool without sudo, execute the follow instructions:

Access in visudo:

    sudo visudo

And append the follow line in the end of file:

    sk ALL=NOPASSWD:/bin/htop,/usr/sbin/openvpn,/bin/kill,/usr/bin/lsof