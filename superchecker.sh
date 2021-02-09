USERNAME=root
PASSWORDS=("")
HOSTS="$(cat hosts.txt)"
SCRIPT="/bin/bash -c \"hostname"\"

for HOSTNAME in ${HOSTS} ; do
    sshpass -p ${PASSWORDS} ssh -o ConnectTimeout=1 -o ConnectionAttempts=1 -o StrictHostKeyChecking=no -l ${USERNAME} ${HOSTNAME} ${SCRIPT} &
done
