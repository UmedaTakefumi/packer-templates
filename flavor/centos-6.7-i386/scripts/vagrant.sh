date > /etc/vagrant_box_build_time
mkdir -pm 700 /home/vagrant/.ssh

# ERROR:
#	==> virtualbox-iso:   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#	==> virtualbox-iso:                                  Dload  Upload   Total   Spent    Left  Speed
#	==> virtualbox-iso:   0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
#	==> virtualbox-iso: curl: (35) SSL connect error
#	==> virtualbox-iso: chmod: cannot access `/home/vagrant/.ssh/authorized_keys': No such file or directory
#
#curl -L https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -o /home/vagrant/.ssh/authorized_keys

cat <<-'VAGRANT_PUB_KEY' > /home/vagrant/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key
VAGRANT_PUB_KEY

chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
