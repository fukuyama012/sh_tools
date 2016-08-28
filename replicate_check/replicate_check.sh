#!/bin/sh
# * check mysql replication status
# * @license replicate_check v0.0.1
# * License: MIT

ALERT_TO="xxxx@xxxx.co.jp";
ALERT_SUBJECT="[MySQL] replication alert";

# MySQLパスワード
mysql_pw=passxxxx

#mysql -u root -p$mysql_pw -e "show slave status \G" | grep Running | grep -v Yes
chk=`mysql -u root -p$mysql_pw -e "show slave status \G" | grep Running | grep -v Yes`

if [ "$chk" != "" ]; then
    msg="Replication Stopping.. : Check the replication Status!";   
    chk2=`mysql -u root -p$mysql_pw -e "show slave status \G"`
    (echo -e "${msg}\n\n${chk2}" | mailx -s "$ALERT_SUBJECT" "$ALERT_TO");
fi


