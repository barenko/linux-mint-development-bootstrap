I'm a old school developer that passed through several technologies and environments. I handle with languages, applications and SO's as tools and I don't have any compassion or addiction for any of them. I choose environments and tools by the praticity to get the job done. These scripts were done with this concept in mind. 

I made this project with the environment that I currently use. If you like the conception of the project, you can help to improve the scripts with other nice and pratical development tools! Be free to talk with me about it.


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

    your_username ALL=NOPASSWD:/bin/htop,/usr/sbin/openvpn,/bin/kill,/usr/bin/lsof

> Don't forget to replace `your_username` with your username...