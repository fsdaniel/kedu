#!/bin/bash
# True
# - This script will replace all PLACEHOLDER_ vars with the vars set in the env
# - Read the README.md for more info


export ENV_DOMAIN="sharethe.net"
export ENV_EDNS_API_KEY=""
export ENV_HARBOR_KEY=""


FILE_NAME=$(basename "$0")
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -z "$ENV_DOMAIN" ] \
|| [ -z "$ENV_EDNS_API_KEY" ] \
|| [ -z "$ENV_HARBOR_KEY" ]; then
	echo "Not all environments vars are set, please check README.md"
	exit 1
fi

files_replace="$(grep -rl 'PLACEHOLDER_' . | grep -iv "$FILE_NAME\|README.md")" 


sed_cmd="sed -i"

echo "These files will get replaced"
echo "$files_replace"
read -p "Are you sure? (y/n)" -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]; then
	while read file ; do
		$sed_cmd "s/PLACEHOLDER_DOMAIN/$ENV_DOMAIN/g" "$file"
		$sed_cmd "s/PLACEHOLDER_EDNS_API_KEY/$ENV_EDNS_API_KEY/g" "$file"
		$sed_cmd "s/PLACEHOLDER_HARBOR_KEY/$ENV_HARBOR_KEY/g" "$file"  
	done <<< "$files_replace" 
fi

