#!/bin/sh

set -e

if [ $# -ne 2 ]; then
	cat <<USAGE
$0 <username> <password>

Creates a 'delicious.html' file in the current directory with all your bookmarks.

USAGE
	exit 1
fi

user="$1"
pw="$2"

curl --data "username=$user&password=$pw" --cookie-jar cookies.txt https://delicious.com/login > /dev/null 2>&1
curl -L --data "include_tags=yes&include_notes=yes" --cookie cookies.txt -O -J -s http://export.delicious.com/settings/bookmarks/export
rm cookies.txt
