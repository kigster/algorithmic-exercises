#!/usr/bin/env bash

color::init() {
  if [ -z "${clr_constants_loaded}" ]; then
    export txtblk='\e[0;30m' # Black - Regular
    export txtred='\e[0;31m' # Red
    export txtgrn='\e[0;32m' # Green
    export txtylw='\e[0;33m' # Yellow
    export txtblu='\e[0;34m' # Blue
    export txtpur='\e[0;35m' # Purple
    export txtcyn='\e[0;36m' # Cyan
    export txtwht='\e[0;37m' # White
    export bldblk='\e[1;30m' # Black - Bold
    export bldred='\e[1;31m' # Red
    export bldgrn='\e[1;32m' # Green
    export bldylw='\e[1;33m' # Yellow
    export bldblu='\e[1;34m' # Blue
    export bldpur='\e[1;35m' # Purple
    export bldcyn='\e[1;36m' # Cyan
    export bldwht='\e[1;37m' # White
    export unkblk='\e[4;30m' # Black - Underline
    export undred='\e[4;31m' # Red
    export undgrn='\e[4;32m' # Green
    export undylw='\e[4;33m' # Yellow
    export undblu='\e[4;34m' # Blue
    export undpur='\e[4;35m' # Purple
    export undcyn='\e[4;36m' # Cyan
    export undwht='\e[4;37m' # White
    export bakblk='\e[40m'   # Black - Background
    export bakred='\e[41m'   # Red
    export bakgrn='\e[42m'   # Green
    export bakylw='\e[43m'   # Yellow
    export bakblu='\e[44m'   # Blue
    export bakpur='\e[45m'   # Purple
    export bakcyn='\e[46m'   # Cyan
    export bakwht='\e[47m'   # White
    export txtrst='\e[0m'    # Text Reset

    export clr_constants_loaded=yes

    export GREP_COLOR=32
  fi
}

color::init

section::h2() {
  section::colored::header bakpur bldwht bakpur bldwht $*
}

section::h1() {
  section::colored::header bakblu bldwht bakblu bldwht $*
}

section::colored::header() {
  local bgcolor=$1; shift
  local fgcolor=$1; shift
  local bgcolor_title=$1; shift
  local fgcolor_title=$1; shift

  local title=$*

  len=${#title}
  cols=$(columns)
  whitespace=8
  w=$((($cols - $len - ${whitespace})/2))
  r=$((($cols - $len - ${whitespace})%2))
  printf "${!bgcolor}${!fgcolor}%*s ${!bgcolor_title}${!fgcolor_title} ⟨ %s ⟩ ${!bgcolor}${!fgcolor} %*s" $w ' ' "$title" $w ' '
  [[ ${r} == 1 ]] && printf " "
  printf "${txtrst}\n"
}

columns() {
  tput cols
}

for file in $(ls -1 bash); do
  [[ $file == 'libutil.sh' ]] && continue
  source bash/${file}
done
