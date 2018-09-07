#!/system/bin/sh
# Battery Life Extender
# JayminSuthar @ xda-developers

# Copyright (c) 2018 Jaymin Suthar. All rights reserved.

# This file is a part of "Battery Life Extender (blex)".

# blex is released under the GNU GPL v3 license as published
# by the Free Software Foundation. And you hereby, are given
# permission to use, modify or redistribute it either partly
# or entirely, under v3 or any later version of the GPL.

# blex is provided to be useful, and no warranty, support or
# fitness for a specific purpose is promised with it, and to
# just not blame me for anything it caused, see the GPL.

# blex is always built with a copy of GPLv3 (COPYING) in the
# top folder, if not see <http://www.gnu.org/licenses/>.

blex_dir=/sbin/.core/img/blex
bin_dir=$blex_dir/bin

exec 2>$blex_dir/log/boot.log
set -x

( (
sleep 5
$bin_dir/busybox --install $bin_dir/

sleep 120
PATH=/sbin:/system/bin:/system/xbin:/vendor/bin blex --detach --skip-logs --run-daemon </dev/null >/dev/null 2>&1
) &)
