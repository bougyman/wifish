#!/bin/sh
errors=0
errmsgs=""
add_err() {
	err=$1
	errors=$((errors+1))
	errmsgs="$errmsgs '$err'"
}
tfile=$(mktemp /tmp/$$.XXX.parsed)
trap 'rm -f $tfile' INT TERM EXIT
awk -f ../iwparse.awk ../data/scan.txt > $tfile

lcount=$(cat $tfile|wc -l)
if [ $lcount -eq 1 ];then
	add_err "No Output! At line 14"
fi

if [ $lcount -ne 13 ];then
	add_err "Expected 13 lines, got $lcount"
fi

echo Total Errors: $errors

if [ $errors -gt 0 ];then
	echo Details: $errmsgs
fi
exit $errors

