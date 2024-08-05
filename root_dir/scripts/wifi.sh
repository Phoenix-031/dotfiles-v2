nmcli device wifi list | awk '{if(NR>1) print $1}'

nmcli device wifi list | awk '{if(NR>1) print $1, $2}'