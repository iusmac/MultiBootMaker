#!/usr/bin/env bash

# MIT License
#
# Copyright (c) 2021 iusmac
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Script settings {{{1
# Run-time {{{2
set -o nounset

if [ -n "${DEBUG:-}" ] && [ "$DEBUG" = '1' ]; then
    set -o xtrace
fi

readonly __VERSION__='0.1alpha'

readonly __SECTION_ICON__='▶'
readonly __BOLD__='\033[1m'
readonly __RED__='\033[1;31m'
readonly __GREEN__='\033[1;32m'
readonly __BLUE__='\033[1;34m'
readonly __PURPLE__='\033[1;35m'
readonly __ORANGE__='\033[1;33m'
readonly __NC__='\033[0m' # No Color

readonly __WELCOME_MSG__="${__PURPLE__}MultiBoot Maker${__NC__} $__VERSION__ (iusmac 2021)"

# GRUB settings {{{2
readonly GRUB_PART_SIZE='16MiB' # min 16MiB since fat16 is used

readonly GRUB_CONF_FILE='/grub/grub.cfg' # absolute path on external device

readonly GRUB_DEFAULT_GLOBAL_OPTS=$(cat << EOL
set menu_color_normal=white/black
set menu_color_highlight=black/light-gray
${GRUB_EXTERNAL_GLOBAL_OPTS:-}
EOL
)

readonly GRUB_DEFAULT_MENU_ENTRY_OPTS="$(cat << END
# Use rmmod only on EUFI systems
if test "\$grub_platform" = "efi"; then
    rmmod tpm
fi

insmod part_msdos

${GRUB_EXTERNAL_MENU_ENTRY_OPTS:-}
END
)"
# }}}2 }}}1

main() {
    # Init {{{1
    # Welcome message {{{2
    echo -e "$__WELCOME_MSG__"

    # Check root perms {{{2
    # }}}2

    # Device management {{{1

    # End {{{1
    # }}}1
}

# Functions & utils {{{1
is_number() { # {{{2
    local input="${1:-}"
    [[ "$input" =~ ^[0-9]+$ ]]
}
# }}}1

main

# vim: set sw=4 sts=4 et fdm=marker:
