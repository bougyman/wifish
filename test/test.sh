#!/bin/sh
errors=0
errmsgs=""
test_int=Testing
add_err() {
	err=$1
	errors=$((errors+1))
	errmsgs="$errmsgs '$err'"
}
tfile=$(mktemp /tmp/$$.XXX.parsed)
trap 'rm -f $tfile' INT TERM EXIT

_IN_TEST=true ./wifish -d $test_int > $tfile

lcount=$(cat $tfile|wc -l)
if [ $lcount -lt 2 ];then
	add_err "No Output! At line 17"
fi

if [ $lcount -ne 13 ];then
	add_err "Expected 13 lines, got $lcount"
fi

interface=$(head -1 $tfile|awk '{print $(NF-1)}')
if [ $interface != Testing ];then
	add_err "Expected interface to be '$test_int', got '$interface'"
fi

echo Total Errors: $errors

if [ $errors -gt 0 ];then
	echo Details: $errmsgs
fi
exit $errors

