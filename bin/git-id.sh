#!/bin/bash
_sn="$(basename $0)"               # Script name
_cf="${HOME}/.config/otzarri-devops/git-identities.yaml"             # Script's config file
_wd="$(realpath $(dirname ${0}))"  # Script's working dir

# Exit if the working dir is not a git repository
git -C . rev-parse 2>/dev/null
if [[ $? -ne 0 ]]; then
    echo "No git repo here"
    exit 1
fi

# Print current identity
echo "Current identity:"
echo "- User name: $(git config user.name)"
echo "- User email: $(git config user.email)"

# Exit if no changes needed
read -r -p "Do you want to change the current identity? [y/N] " response
response=${response,,}    # tolower
if [[ ! "$response" =~ ^(yes|y)$ ]]; then exit 0; fi
unset response

# List all the identities
git_identities=($(yq -r '. | keys[]' $_cf))
if [[ ! ${#git_identities[@]} -gt 0 ]]; then
    echo "No git identities found in $_cf"
    exit 1
fi

echo "List of git identities in $_cf"
for i in "${!git_identities[@]}"; do 
    id_name=${git_identities[$i]}
    user_name=$(yq -r ".${id_name}.user_name" $_cf)
    user_email=$(yq -r ".${id_name}.user_email" $_cf)
    printf "%s) %s\t%s\n" $i "$id_name" "$user_name <$user_email>"
done

response=-1
max_id=$(( ${#git_identities[@]} - 1 ))
while [[ ${response} -lt 0 ]] || [[ ${response} -gt ${max_id} ]]; do
    read -r -p "Select an identity (0-$max_id): " response
done

id_name=${git_identities[$response]}
user_name=$(yq -r ".${id_name}.user_name" $_cf)
user_email=$(yq -r ".${id_name}.user_email" $_cf)
unset response

echo "Applying identity ${id_name}"
echo "- User name: ${user_name}"
echo "- User email: ${user_email}"
git config user.name "${user_name}"
git config user.email "${user_email}"

