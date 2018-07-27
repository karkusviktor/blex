#!/system/bin/sh
# My Charging Controller
# mcc Boot 1 (201807271)
# JayminSuthar @ xda-developers

# Copyright (c) 2018 Jaymin Suthar. All rights reserved.

# This file is a part of "My Charging Controller (mcc)".

# mcc is released under the terms of the GNU GPL v3, as been
## published by the Free Software Foundation. And permission
## hereby is granted to use, modify or redistribute it maybe
## partially or entirely under GPLv3 only.

# mcc was written in a hope of being useful. And any kind of
## warranty is not provided. See GPLv3 for details.

# You should already have received a copy of GPLv3 with mcc,
## if not, see <http://www.gnu.org/licenses/>.

mcc_dir=${0%/*};
log_dir=$mcc_dir/log;
sys_dir=$mcc_dir/system;

(
set -x 2>$log_dir/boot.log;

main_path=$(ls $sys_dir/xbin/mcc || ls $sys_dir/bin/mcc);

sed -i "s|^mcc_dir=.*|mcc_dir=$mcc_dir;|" $main_path;
grep -m 1 '^mcc_dir=' $main_path >&2;
chmod 0600 $main_path;
touch $mcc_dir/pfsd_done;

) 2>$log_dir/boot_err.log &
