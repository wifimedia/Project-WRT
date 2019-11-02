#!/bin/sh /etc/rc.common

cfg_groups_set()
{

   CFG_FILE="/etc/config/openclash"
   local section="$1"
   config_get "name" "$section" "name" ""
   config_get "old_name_cfg" "$section" "old_name_cfg" ""
   config_get "old_name" "$section" "old_name" ""

   if [ -z "$name" ]; then
      return
   fi
   
   
   #名字变化时处理配置文件
   if [ "$name" != "$old_name_cfg" ]; then
      sed -i "s/\'${old_name_cfg}\'/\'${name}\'/g" $CFG_FILE 2>/dev/null
      sed -i "s/old_name \'${name}\'/old_name \'${old_name}\'/g" $CFG_FILE 2>/dev/null
      config_load "openclash"
   fi

}

start(){
status=$(ps|grep -c /usr/share/openclash/yml_groups_name_ch.sh)
[ "$status" -gt "3" ] && exit 0

   config_load "openclash"
   config_foreach cfg_groups_set "groups"
}
