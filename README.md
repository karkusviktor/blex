###### My Charging Controller
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

* #### Extend batteries' life with fun, let mcc handle this.

## Description

* mcc exists because of the chemistry/mathematics of lithium
   batteries. They are fun in the way they work, and mcc was
   programmed to make the fun give out gold. mcc wraps every
   little thing (unless noted) to keep it from any flaws one
   might ever face. You can bypass them though.

* mcc provides you a great Automation for the purpose. It'll
   start a daemon every time the device boots, which handles
   all these. It provides 1) Auto Switch, 2) Auto Power. The
   latter powers the device OFF when battery level's below a
   specified 'thr_power', so the battery does not drain much
   that it needs a lot of volts. The first, that switches ON
   and OFF charging maintaing a cycle which never quits it's
   boundaries for the sake of the batteries' life. This does
   a massive help in maintaining battery health/performance.
   Charging's disabled when 'thr_disable' is hit and enabled
   back when 'thr_enable' is hit. It also gains us a massive
   cutout in total charge cycles as counted against possible
   available lifecycles.

* Other features provided include resetting batterystats and
   manual methods. Resetting stats is a common practice that
   parts into recalibrating the battery. But, manual methods
   do not have a specific purpose. You can find many uses of
   them while playing soccer. They basically allow to enable
   or disable charging on demand until some level is reached
   or some time has passed. They do not have an mcc wrapper!
   Every other option you see, is an utility for mcc.

* Automation is enabled by default with optimal thresholds I
   think. 'thr_disable', 'thr_enable' and 'thr_power' are as
   80, 70 and 20.

## Requirements

* An arm-based chipset.
* Magisk v14.6+ for systemless mode.
* Any root solution if system mode.
* init.d support for system mode.
* Basic terminal/CLI knowledge.

## Installation

* Flash the zip from recovery or Manager. The installer will
   do the job prioritizing systemless mode over system mode.
   Installation logs will be placed at /dev/mcc_install.log.
   mcc files will be saved in magisk.img if systemless mode,
   else in /data/adb/mcc.

## Usage

* Open a new terminal window and run `su` to gain root. Then
   run mcc with proper arguments (check 'Arguments'). You're
   allowed to close the window afterwards since mcc detaches
   from the terminal. '$mod_dir/log/main.log' will have logs
   for the last mcc call. If you don't need them, a directly
   assigned 'skip_mcc_logs=true' does the trick.

## Arguments

    [--switch] [thr_disable] [thr_enable]

    -> Update 'thr_disable', 'thr_enable' from arguments and
    figure out 'the_enable' if not given.

    [--power] [thr_power]

    -> Update 'thr_power' to the specified value.

    [--force] [--switch/--power] ...

    -> Forcibly update Automation thresholds.

    [--revert]

    -> Revert Automation thresholds to their defaults.

    [--toggle] [--switch/--power/--revert]

    -> Toggle Automation features ON/OFF, [--revert] reverts
    both to their defaults.

    [--enable] [level/time]

    -> Enable charging until specified level has been hit or
    time has passed.
    -> Formats allowed: {level}%, {time}s, {time}m, {time}h.

    [--disable] [level/time]

    -> Same as above, except for charging is disabled.

    NOTE: [--enable/--disable] are manual methods, so do not
    provide any safety checks.

    [--cleanup]

    -> Kill all mcc processes (including the daemon).

    [--ckdaemon]

    -> Check the mcc daemon, and start if not running.

    [--restat]

    -> Reset battery statistics.

    [--config]

    -> Configure mcc at lower level, requires charging ON.

    [--reset]

    -> Reset batterystats and configure mcc.

    [--info]

    -> Print some information.

    [--help]

    -> Show this help page.

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
* mcc --ckdaemon
* mcc --restat
* mcc --config
* mcc --reset
* mcc --info
* mcc --help

## Support

* If your device reboots while configuring, reboot to system
   and try again (this is a workaround). If the device still
   reboots, or you're facing any other bugs/issues, I advise
   to visit the 'Support Thread' (see links). Describe it as
   widely as you can, also provide any relevant logs. And if
   you wish to support my efforts, don't hesitate to 'Thank'
   me on the thread.

## Credits

* @topjohnwu for creating Magisk.
* @osm0sis for their BusyBox binary.
* Every mcc beta tester :)

## Changelog

#### Redefined 1.1.1

* I'm currently porting this project Shell -> native "C". No
   feature builds, will be released for the shell version of
   it. Only bugfixes! Keep reporting please.
* In case you're interested, porting to "C" will allow it to
   function even without a root solution, though requiring a
   custom recovery. Also executions will be hell-lot-of fast
   and much less resource heavy (current: 7MB).

* Fix the daemon incorrectly reverting the switch.
* Fix boot script not launching the daemon.
* Fix Install script aborting in recovery.
* Fix A/B slot detection for some devices.
* Fix permissions for generated files.
* Fix read-only filesystem errors.
* Fix lost BusyBox applet links.
* Fix other bugs I discovered.
* Automatically implement skip_root workaround.
* Improvements (logging, daemon, algorithms).
* Remove Magisk versionCode checking.
* Remove separate error log_files.
* Remove lock file feature.
* Update BusyBox to 1.29.2.
* Update documentation.
* Update arguments.
* Update UI.
