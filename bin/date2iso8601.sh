#!/bin/bash
#
# @brief   Converts DD/MM/YYYY date format to ISO-8601 (YYYY-MM-DD)
# @version ver.1.0
# @date    Mon Jul 15 21:44:32 2015
# @company Frobas IT Department, www.frobas.com 2015
# @author  Vladimir Roncevic <vladimir.roncevic@frobas.com>
#
UTIL_DATE2ISO8601=date2iso8601
UTIL_VERSION=ver.1.0
UTIL=/root/scripts/sh-util-srv/$UTIL_VERSION
UTIL_LOG=$UTIL/log

. $UTIL/bin/usage.sh
. $UTIL/bin/devel.sh

declare -A DATE2ISO8601_USAGE=(
    [TOOL_NAME]="__$UTIL_DATE2ISO8601"
    [ARG1]="[TOOL_NAME] Name of App/Tool/Script"
    [EX-PRE]="# Converting time to iso8601"
    [EX]="__$UTIL_DATE2ISO8601 \"tester.log\""	
)
#
# @brief  Converts DD/MM/YYYY date format to ISO-8601 (YYYY-MM-DD)
# @param  Value required file name 
# @retval Success return 0, else return 1
#
# @usage
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#
# local FILE_NAME="/home/vroncevic/Documents/meeting_date.txt"
# __date2iso8601 "$FILE_NAME"
# local STATUS=$?
#
# if [ "$STATUS" -eq "$SUCCESS" ]; then
#   # true
#	# notify admin | user
# else
#   # false
#	# missing argument
#	# return $NOT_SUCCESS
#	# or
#	# exit 128
# fi
#
function __date2iso8601() {
    local FILE_NAME=$1
    if [ -n "$FILE_NAME" ]; then
		local FUNC=${FUNCNAME[0]}
		local MSG=""
		if [ "$TOOL_DBG" == "true" ]; then
			MSG="Converts DD/MM/YYYY date format to ISO-8601 (YYYY-MM-DD)"
			printf "$DSTA" "$UTIL_DATE2ISO8601" "$FUNC" "$MSG"
		fi
		local EX='s_\([0-9]\{1,2\}\)/\([0-9]\{1,2\}\)/\([0-9]\{4\}\)_\3-\2-\1_g'
        sed $EX $FILE_NAME
		if [ "$TOOL_DBG" == "true" ]; then
			printf "$DEND" "$UTIL_DATE2ISO8601" "$FUNC" "Done"
		fi
        return $SUCCESS
    fi 
    __usage $DATE2ISO8601_USAGE
    return $NOT_SUCCESS
}
