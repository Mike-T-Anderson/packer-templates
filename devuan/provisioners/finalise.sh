#!/bin/sh -ex
test -f /root/.ssh/authorized_keys && sed -i '/^ssh-rsa.*vagrant insecure public key$/d' /root/.ssh/authorized_keys
sed -e '/^PermitRootLogin yes/s/yes/no/' \
    -e '/^PasswordAuthentication yes/s/yes$/no/' \
    /etc/ssh/sshd_config > /tmp/sshd_config
mv /tmp/sshd_config /etc/ssh/shd_config
echo "UseDNS no" >> /etc/ssh/sshd_config
rm -f /root/VBoxGuestAdditions*
