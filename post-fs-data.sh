#!/system/bin/sh
# Battery Life Extender
# JayminSuthar @ xda-developers

# Copyright (c) 2018 Jaymin Suthar. All rights reserved.

# This file is a part of "Battery Life Extender (blex)".

# blex is released under the terms of GNU GPL v3 as published
# by the Free Software Foundation, and you hereby are allowed
# to use, modify or redistribute it, either pieces of it or
# entirely under v3 or any later version of the GPL.

# blex is developed in a hope of being useful, but neither
# warranty nor support are promised with it, not even fitness
# for the particular purpose. See the GPLv3 for details.

# A copy of GPLv3 (COPYING) is placed in the root folder of
# blex, see <https://www.gnu.org/licenses/> for more.

blex_dir=/sbin/.core/img/blex
bin_dir=$blex_dir/bin

exec 2>$blex_dir/log/boot.log
set -x

( (
sleep 5
$bin_dir/busybox --install -s $bin_dir/

sleep 120
PATH=/sbin:/vendor/bin:/system/bin:/system/xbin blex --detach --skip-logs --run-daemon </dev/null >/dev/null 2>&1
) &)
