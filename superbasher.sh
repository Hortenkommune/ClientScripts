USERNAME=root
PASSWORDS=("")
HOSTS="$(cat hosts.txt)"
SCRIPT=#"/bin/bash -c \"if [[ \$(ps aux | grep wfica | grep -vc grep) -gt 0 ]]; then echo looping; while pgrep \"wfica\" ; do sleep 2 ; done ; else echo rebooting ; fi ; /sbin/reboot\""

for HOSTNAME in ${HOSTS} ; do
    sshpass -p ${PASSWORDS} ssh -o ConnectTimeout=1 -o ConnectionAttempts=1 -o StrictHostKeyChecking=no -l ${USERNAME} ${HOSTNAME} ${SCRIPT} &
done
