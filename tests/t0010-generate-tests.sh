#!/usr/bin/env bash

test_description='Test generate'
cd "$(dirname "$0")"
. ./setup.sh

test_expect_success 'Test "generate" command' '
	"$PASS" init $KEY1 &&
	"$PASS" generate cred 19 &&
	[[ $("$PASS" show cred | wc -m) -eq 20 ]]
'

test_expect_success 'Test replacement of first line' '
	"$PASS" insert -m cred2 <<<"$(printf "this is a big\\npassword\\nwith\\nmany\\nlines\\nin it bla bla")" &&
	"$PASS" generate -i cred2 23 &&
	[[ $("$PASS" show cred2) == "$(printf "%s\\npassword\\nwith\\nmany\\nlines\\nin it bla bla" "$("$PASS" show cred2 | head -n 1)")" ]]
'

test_expect_success 'Test replacement of first line with random' '
    PASSWD="this is a big\\npassword\\nwith\\nmany\\nlines\\nin it bla bla" &&
    "$PASS" insert -m cred3 <<<"$(printf "$PASSWD")" &&
    GENERATED="$("$PASS" generate -n -i cred3 20 | cut -f7 -d\ | tr -d "[:space:]" | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g")" &&
    REMAIN="$(echo -e $PASSWD | tail -n $(printf "$PASSWD" | wc -l))" &&
    [[ $("$PASS" show cred3) == "$(printf "${GENERATED}\\n${REMAIN}")" ]]
'

test_done
