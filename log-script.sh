datetime=$(date +'%F %H:%M')
user=$(whoami)
tty=$(tty)
remote_ip=$(echo $(last | head -n 1) | cut -d ' ' -f 3)

if ! $(test -d /dados/nfs); then
	mkdir -p /dados/nfs
fi

echo "$datetime; $user; $tty; $remote_ip" >> /dados/nfs/acessos
