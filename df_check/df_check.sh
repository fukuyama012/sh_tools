#!/bin/sh
# * check capacity status
# * @license df_check v0.0.1
# * License: MIT

ALERT_TO="xxxx@xxxx.co.jp";
ALERT_SUBJECT="[Strage Check] df comman alert";

# ドライブ名
drive=/dev/vda1

#70～99%の時アラート *十の位の数字を適宜書き換えて下さい
chk=`df | grep $drive | grep '[7-9][0-9]%'`

#echo ${chk}

if [ "$chk" != "" ]; then
    msg="Strage Check df command Alert!";
    (echo -e "${msg}\n\n${chk}" | mailx -s "$ALERT_SUBJECT" "$ALERT_TO");
fi


