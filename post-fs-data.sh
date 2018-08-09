#!/system/bin/sh
# My Charging Controller
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

mcc_dir=${0%/*}
bin_dir=$mcc_dir/system/xbin
lock_path=$mcc_dir/.lock

umask 022
exec 2>$mcc_dir/log/boot.log
set -x

if test ! -d $bin_dir; then bin_dir=${bin_dir%/*}/bin; fi

set_prop() {
  sed -i "s|^$1=.*|$1=$2|" $3
}

set_prop mcc_dir   $mcc_dir $bin_dir/mcc
set_prop switch_do default  $mcc_dir/mcc.conf
touch $lock_path

sleep 120
rm $lock_path
PATH=$bin_dir:/sbin:/system/xbin:/system/bin:/vendor/bin skip_mcc_logs=true mcc --launch-daemon </dev/null >/dev/null 2>&1
