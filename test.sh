#!/bin/bash

now=$(date +"%d-%m-%Y")
log_file=/home/install/log_script_install-$now.log
touch $log_file
echo "Debut du script" > $log_file

# Premier parametre: MESSAGE
# Autres parametres: COMMAND
displayandexec() {
  local message=$1
  echo -n "[En cours] $message"
  shift
  echo ">>> $*" >> $log_file 2>&1
  sh -c "$*" >> $log_file 2>&1
  local ret=$?
  if [ $ret -ne 0 ]; then
    echo -e "\r\e[0;30m $message                       \e[0;31m[ERROR]\e[0m "
  else
    echo -e "\r\e[0;30m $message                       \e[0;32m[OK]\e[0m "
  fi
  return $ret
}
#exemple :
displayandexec "Installation de mediainfo" "apt-get install -y mediainfo"
displayandexec "Installation de mediainfo" "apt-get install -y meinfo"
