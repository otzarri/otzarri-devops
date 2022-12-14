#!/usr/bin/env bash
set -e

old_branch="$(git branch --show-current)"
new_branch="${1}"

echo -e "\nCurrent branch: ${old_branch}"
if [[ -n "${new_branch}" ]]; then
    echo "New branch: ${new_branch}";
fi
while [[ -z "${new_branch}" ]]; do
    read -r -p "New branch: " new_branch
done

echo "Branch \"${old_branch}\" will be renamed to \"${new_branch}"\"
echo "This change will be applied to both local and remote branches"
read -n 1 -s -r -p "Press any key to continue or Ctl+c to quit"; echo -e "\n"

git branch -m "${new_branch}" && \
git push origin -u "${new_branch}" && \
git push origin --delete "${old_branch}"
