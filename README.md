###### My Charging Controller
###### mcc README File
###### JayminSuthar @ xda-developers

###### Copyright (c) 2018 Jaymin Suthar. All rights reserved.

## Legal

* This file is a part of "My Charging Controller (mcc)".

* mcc is released under the terms of the GNU GPL v3, as been
   published by the Free Software Foundation. And permission
   hereby is granted to use, modify or redistribute it maybe
   partially or entirely under GPLv3 only.

* mcc was written in a hope of being useful. And any kind of
   warranty is not provided. See GPLv3 for details.

* You should already have received a copy of GPLv3 with mcc,
   if not, see <http://www.gnu.org/licenses/>.

## Links

* [Git Repository](https://github.com/Magisk-Modules-Repo/My-Charging-Controller)
* [Support Thread](https://forum.xda-developers.com/apps/magisk/mcs-charging-controller-t3739371)

## Introduction

* #### mcc lies around controlling charging in a better way.

## Description

* mcc provides Automated and Manual methods. Auto Switch and
   Auto Power are part of the automation, whereas [--restat]
   and [--enable/--disable] are manual methods. Others there
   are extensions for both these. Auto Switch makes charging
   to stop when battery level exceeds 'thr_disable', and re-
   start when it falls below 'thr_enable'. Auto Power powers
   OFF the device when the level goes below 'thr_power'. For
   details about other features, check options.

* Auto Switch/Power are ON by default. 'thr_power' is 20 and
   'thr_disable', 'thr_enable' are 80, 70.

## Installation

* Flash mcc from recovery or Magisk Manager. mcc will detect
   and install in Magisk > system mode. Only arm-based archs
   are supported. Logs are placed at /dev/mcc_logs.

## Usage

* Run `mcc [OPTIONS]` from a good terminal (such as Termux).
* For escalated privileges, terminal must have a root shell.

## Setup

* Run the [--reconfig] option after installing/updating mcc.

## Options

* [--switch] [thr_disable] [thr_enable]

-> Sets Auto Switch thresholds to thr_disable, thr_enable. A
    good thing suggests thr_enable to be optional.

* [--power] [thr_power]

-> Sets Auto Power threshold to thr_power.

* [--force] [--switch/--power] ...

-> Sets Auto Switch/Power thresholds ignoring all the tests.

* [--revert]

-> Reverts Auto (daemon) thresholds to their defaults.

* [--toggle] [--switch/--power/--revert]

-> Toggles Auto Switch/Power ON/OFF, [--revert] reverts both
    to their defaults.

* [--enable] [level/time]

-> Enables charging for given time or until some batt_level.
-> Accepted formats: {level}%, {time}s, {time}m, or {time}h.

* [--disable] [level/time]

-> Same as above, except for charging is disabled.

* [--cleanup]

-> Kills all mcc processes (even the daemon), and resets the
    daemon.

* [--redaemon]

-> Relaunches the mcc daemon unless already running.

* [--restat]

-> Resets battery statistics.

* [--reconfig]

-> Reconfigures mcc at lower level, requiring charging ON.

* [--reset]

-> Runs [--restat] and [--reconfig] one after one.

* [--info]

-> Shows details about current battery stats, mcc config and
    daemon status.

* [--help]

-> Shows the current README page.

## Examples

* mcc --switch 70 60
* mcc --switch 45
* mcc --power 15
* mcc --force --switch 95 90
* mcc --force --switch 10
* mcc --force --power 4
* mcc --revert
* mcc --toggle --switch
* mcc --toggle --power
* mcc --toggle --revert
* mcc --enable 60%
* mcc --enable 120s
* mcc --enable 20m
* mcc --enable 2h
* mcc --disable 20%
* mcc --disable 30s
* mcc --disable 40m
* mcc --disable 1h
* mcc --cleanup
* mcc --redaemon
* mcc --restat
* mcc --reconfig
* mcc --reset
* mcc --info
* mcc --help

## Tips/Misc

* If mcc causes a reboot while configuring, create a file at
   /data/adb/skip_mcc_root.
* mcc execution will be blocked if '$mcc_dir/lock' is there,
   and the daemon will go to sleep.
* mcc runs in a detached mode, which means you can close the
   terminal afterwards.
* The mcc daemon handles all the switching, CLI communicates
   with it for manual methods.
* All mcc files are stored at MOUNTPOINT/mcc > /data/adb/mcc
   for Magisk > system mode.
* mcc disables logging if '$disable_mcc_logs' exists in env.

## Remember

* mcc will not run for 120 seconds after each boot (safety).
* The [--cleanup] option kills the mcc daemon, too. Careful!
* Resetting batterystats does not work for some old devices.

## Support

* I try my best to make mcc as good as possible. mcc support
   is provided at its official support thread.

## Credits

* @topjohnwu for creating Magisk.
* @osm0sis for their BusyBox binary.
* Every mcc beta tester :)

## Encourage Me

* Please hit 'Thanks' if you think I deserve one.

## Release Notes

#### Redefined 1.1

* Provide an uninstaller for Magisk > system mode.

* Fix incorrect daemon status in [--info].
* Fix control references identification.
* Fix mounting issues for some devices.
* Fix 'internal error' for system mode.
* Fix racial condition with [--reset].
* Fix boot scripts error logging.
* Fix BusyBox aborting setup.
* Fix other minor bugs.
* Remove unnecessary x86 BusyBox.
* Remove unnecessary img resizal.
* Remove late_start boot script.
* Remove the wrapper around su.
* Install mcc to xbin for system mode.
* Use BusyBox for mcc Install script.
* Add logging to the Install script.
* Update the behaviour of lock_file.
* Update strings.
* Update README.

#### Redefined 1.0.2

* Fix the daemon not writing control nodes.
* Internal code improvements.
* Update README.

#### Redefined 1.0.1

* Fix daemon not launching with beta Magisk.
* Fix control reference nodes never identified.
-> This should fix daemon not working and always reconfiguring.
* Fix safe boundaries for [--switch/--power].
* Fix some algotithmic flaws.
* Update BusyBox to 1.29.1.
* Update strings.

#### Redefined 1.0.MR

* Fix a few bugs with BusyBox and UI.
* Update README for public release.

#### Redefined 1.0

* Initial redefined release.
