###### My Charging Controller
###### mcc README (201807261)
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

## Usage

* Run `mcc [OPTIONS]` from a good terminal (such as Termux).

## Setup

* Run the '--reconfig' option for the first time you use it.

## Options

* [--switch] [thr_disable] [thr_enable]

-> Sets Auto Switch thresholds to thr_disable, thr_enable. A
    good thing suggests [thr_enable] to be optional.

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

-> Same as above, except for charging is disabled with this.

* [--cleanup]

-> Kills all mcc processes (including the daemon), and stats
    are reset for the daemon.

* [--redaemon]

-> Relaunches the mcc daemon unless already running.

* [--restat]

-> Resets battery statistics.

* [--reconfig]

-> Reconfigures mcc at the low_level, requiring charging ON.

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
* mcc --force --power 3
* mcc --revert
* mcc --toggle --switch
* mcc --toggle --power
* mcc --toggle --revert
* mcc --enable 60%
* mcc --enable 120s
* mcc --enable 30m
* mcc --enable 2h
* mcc --disable 25%
* mcc --disable 30s
* mcc --disable 45m
* mcc --disable 1h
* mcc --cleanup
* mcc --redaemon
* mcc --restat
* mcc --reconfig
* mcc --reset
* mcc --info
* mcc --help

## Tips/Misc...

* mcc recognizes root access and handles calling su for you.
* If mcc causes a reboot while configuring, create a file at
   /data/adb/skip_mcc_root.
* The mcc daemon will go to sleep if '$mcc_dir/lock' exists.
* mcc runs in a detached mode, which means you can close the
   terminal afterwards.
* mcc disables logging if '$disable_mcc_logs' exists in env.

## Remember

* The mcc daemon handles all the switching, CLI communicates
   with it for manual mode.
* The '--cleanup' option kills the mcc daemon, too. Careful!
* Resetting batterystats does not work for some old devices.

## Support

* I try my best to make mcc as good as possible. mcc support
   is provided at its official XDA support thread.

## Credits

* @topjohnwu for creating Magisk.
* @osm0sis for their BusyBox binaries.

## Encourage Me

* Please hit 'Thanks' if you like my work.

## Release Notes

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
