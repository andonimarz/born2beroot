# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    monitoring.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amarzana <amarzana@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/28 14:56:11 by amarzana          #+#    #+#              #
#    Updated: 2022/04/28 15:02:21 by amarzana         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
#Arquitecture
echo "#Architecture:" $(uname -a)
#CPU Physical
echo "#CPU physical:" $(lscpu | awk ' NR==5 {print $2}')
#Virtual CPU
echo "#vCPU :" $(lscpu | grep Socket\(s\) | awk '{print $2}')
#Memory Usage
free --mega | awk 'NR==2{printf "#Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2}'
#Disk Usage
df -h | awk '$NF=="/"{printf "#Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'
#CPU Load
top -bn1 | grep load | awk '{printf "#CPU Load: %.2f%%\n", $(NF-2)}'
#Last Boot
echo "#Last boot:" $(who -b | awk ' {print $3,$4}')
#LVM
echo "#LVM use:" $(sudo lvm pvdisplay | grep Allocatable | awk '{print $2}')
#Connections TCP
echo "#Connetions TCP:" $(ss -s | grep TCP | awk 'NR==2 {printf "%d ESTABLISHED\n", $3}')
#User log
echo "#User log:" $(who | wc -l)
#Network IP
echo "#Network: IP" $(hostname -I) $(ip a | grep link/ether | awk '{printf " (%s)\n", $2}')
#Sudo
echo "#Sudo : " $(cat /var/log/sudo/sudo_log | grep USER | wc | awk '{printf "%s cmd\n", $1}')
