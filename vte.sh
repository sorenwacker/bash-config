# Copyright © 2006 Shaun McCance <shaunm@gnome.org>
# Copyright © 2013 Peter De Wachter <pdewacht@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

__vte_urlencode() (
  # This is important to make sure string manipulation is handled
  # byte-by-byte.
  LC_ALL=C
  str="$1"
  while [ -n "$str" ]; do
    safe="${str%%[!a-zA-Z0-9/:_\.\-\!\'\(\)~]*}"
    printf "%s" "$safe"
    str="${str#"$safe"}"
    if [ -n "$str" ]; then
      printf "%%%02X" "'$str"
      str="${str#?}"
    fi
  done
)

# Print a warning so that anyone who's added this manually to his PS1 can adapt.
# The function will be removed in a later version.
__vte_ps1() {
  echo -n "(__vte_ps1 is obsolete)"
}

__vte_osc7 () {
  printf "\033]7;file://%s%s\a" "${HOSTNAME:-}" "$(__vte_urlencode "${PWD}")"
}

__vte_prompt_command() {
  printf "\033]0;%s@%s:%s\007%s" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}" "$(__vte_osc7)"
}

case "$TERM" in
  xterm*|vte*)
    [ -n "$BASH_VERSION" ] && PROMPT_COMMAND="__vte_prompt_command" 
    [ -n "$ZSH_VERSION"  ] && chpwd_functions+=(__vte_osc7)
    ;;
esac

true
