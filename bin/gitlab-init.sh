#!/usr/bin/env bash
_sn="$(basename $0)"               # Script name
_cf="${HOME}/.config/otzarri-devops/gitlab-init.cfg"                   # Script's config file
_wd="$(realpath $(dirname ${0}))"  # Script's working dir

gitlab-init() {
    host="${1}"; ns="${2}"; branch="${3}" user="${4}"; email="${5}"
    repo="$(basename ${PWD})"
    uri="${host}:${ns}/${repo}.git"

    if [ $(ls -A | wc -l) -lt 1 ]; then echo -e "# ${repo}\n\n" > ${PWD}/README.md; fi
    if [ -d "${_wd}/.git" ]; then echo -e "Can't initialize because .git exists\n"; exit 1; fi

    echo "Create repo ${uri}?"
    read -n 1 -s -r -p "Press any key to continue or Ctl+c to quit"; echo -e "\n"
    git init -b ${branch}
    git config user.name "${user}"
    git config user.email "${email}"
    git add .; echo
    git commit -m "Initial commit"; echo
    git push --set-upstream ${uri} ${branch}; echo
    git remote add origin ${uri}.git; echo
}

. ${_cf}

ns=""
while [[ "${ns}" == "" ]]; do
    read -p "Select namespace [${def_ns}]: " ns
    if [[ "${ns}" == "" ]]; then ns="${def_ns}"; fi
done

gitlab-init "${host}" "${ns}" "${branch}" "${user}" "${email}
