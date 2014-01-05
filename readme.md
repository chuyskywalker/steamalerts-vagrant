# SteamAlerts Vagrant/Salt Files

After restoring steamalerts.com from backups, I realized that having to
reconfigure the server everytime it went awry was silly and left me with
inconsistencies and "forgotcha's" in the build.

To resolve that, I'm attempting to utilize [Vagrant](http://www.vagrantup.com/)
+ [Salt](http://www.saltstack.com/) to provision consistent environments both
locally ([Virtualbox](https://www.virtualbox.org/)) and remotely
([EC2](http://aws.amazon.com/ec2/)) for development and production respectively.

The basic setup to get the local Virtualbox setup going is to install
Virtualbox, Vagrant, and get a copy of this repo and then `vagrant up` and
you should be good to go.
