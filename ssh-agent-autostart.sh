agentfile=/dev/shm/ssh-agent
ssh-agent > $agentfile
chmod 600 $agentfile
. $agentfile
