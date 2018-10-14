## This is the devel repository of blex, it might have bugs.

###### Battery Life Extender
###### JayminSuthar @ xda-developers

###### Copyright (c) 2018 Jaymin Suthar. All rights reserved.

## Legal

* This file is a part of "Battery Life Extender (blex)".

* blex is released under the terms of GNU GPL v3 as published
  by the Free Software Foundation, and you hereby are allowed
  to use, modify or redistribute it, either pieces of it or
  entirely under v3 or any later version of the GPL.

* blex is developed in a hope of being useful, but neither
  warranty nor support are promised with it, not even fitness
  for the particular purpose. See the GPLv3 for details.

* A copy of GPLv3 (COPYING) is placed in the root folder of
  blex, see <https://www.gnu.org/licenses/> for more.

## Links

* [Git Repository](https://github.com/Magisk-Modules-Repo/blex)
* [Support Thread](https://forum.xda-developers.com/apps/magisk/mcs-charging-controller-t3739371)
* [Telegram Group](https://t.me/joinchat/IiBDkxCpljv5TH994qtv6Q)

## Introduction

* blex helps in extending/maintaining lithium batteries' life
  by controlling when charging is enabled or disabled.

## Details

* blex is a tool that lets you enable or disable charging in
  programmatic manner so to extend/maintain batteries' life,
  it is reliable and also fully automated.

* Automation provided includes two features which are 'Auto
  Switch' and 'Auto Power'. Auto Switch is a feature which
  disables charging when a disable threshold has been hit and
  enables charging back as soon as the battery level hits an
  enable threshold, whereas Auto Power is a feature which'll
  power the device OFF as soon as level has reached a power
  threshold.

* The purpose behind Auto Switch is to make the battery lie
  inside our specified limits so that a constant charge cycle
  can be maintained that's a basic requirement when you wish
  to extend the batteries' life. It helps to increase maximum
  charge cycles the battery can have and that without losing
  anything.

* And the purpose behind Auto Power is to never let the cells
  lose voltages too low that it might harm bring the battery
  back to the life. This helps to prevent some weirdities like
  unexpected battery levels shown.

* blex also provides you to enable/disable charging manually
  on demand, and that introduces manual methods. You can use
  manual methods to fulfill the need based on either level or
  time, refer to the 'CUI' section for more.

* The 'CUI' section provides details on each flag and option
  that you can use to setup Automation, configure blex, launch
  the daemon, reset battery statistics and more...

## Requirements

* A modern arm-based chipset.
* Basic terminal knowledge.
* (if Magisk install...) Magisk 14.6+.
* (...or else) Any root solution,
* (...or else) Init.d support.

## Installation

* blex supports both the Magisk systemless install and the
  standard /system modifying install, just make sure all the
  requirements are met for that specific install mode and do
  flash the zip from either custom recovery or Magisk Manager
  and blex will detect install mode and install accordingly.

* NOTE: Modifying /system might make your device unbootable.
* NOTE: If Magisk is detected, you can't do standard install.
* NOTE: If Magisk is older than required, it'll automatically
  install in standard /system modifying mode.

## Setup

* After installing, blex requires you to configure itself by
  running 'blex --configure', if you don't do that, blex will
  be of no use to you. This step is required only once after
  installing/upgrading.

* I also recommend you to toggle ON/OFF Automation features
  and set their thresholds to your needs for a set-and-forget
  concept.

* NOTE: Enforcing thresholds outside blex' recommended limits
  is against the purpose of extending batteries' life and thus
  is strongly discouraged. That flag is included just for some
  users who wish to use blex to control charging rather than
  to extend/maintain batteries' life.

## Usage

* blex provides a nice, user-friendly and easy to use CUI to
  the user. This CUI can be used to configure or setup blex or
  to run a manual method, etc... All you need is a terminal
  emulator (like Termux). So, in steps...

* ...launch the terminal,
* write 'su' to have a root shell,
* and call blex by running 'blex [flags] [options] args'.

* NOTE: If you have multiple blex processes running, they may
  interfere with each other, please avoid such conditions.
* NOTE: Most things in CUI are checked and defaulted to some
  action if an argument is not provided.

## CUI

```
* Flags

    [--detach]

    Detach from the terminal and run as a background process.

    [--skip-logs]

    Skip dumping logs to the logfile (to improve performance).

    [--enforce]

    Enforce any value between 1-99 as a valid threshold and
    do not perform mathematics on arguments given.

    NOTE: Flags must be in order [--detach] > [--skip-logs] > [--enforce]
    or else blex will misinterpret them as options.

* Options

    [--update] [switch/power] [disable/power] [enable]

    Update Automation thresholds. The feature that provides
    the thresholds is the first argument and new values of
    thresholds are arguments following that.

    If the feature is Auto Power, second argument is power
    threshold, and if the feature is Auto Switch, second and
    third arguments are disable and enable thresholds as in
    order.

    If enable threshold is not given, it will figure that out,
    and if no threshold is given, it'll revert thresholds of
    the feature to their defaults, and finally, if the feature
    is not given, it will revert every threshold.

    [--toggle] [switch/power] [ON/OFF]

    Toggle Automation feature ON or OFF. The feature to toggle
    is the first argument and the state to toggle to is the
    second.

    If state is not given, it'll invert the feature state like
    ON -> OFF and vice versa, and if the feature is not given,
    both features will be reverted to their default state.

    [--manual] [enable/disable/stop] [level/time]

    Enable or disable charging, or stop every manual method
    running. The action to perform is the first argument and
    the format string for the action (if not stop) is second
    argument.

    If the action is stop, it will stop every manual method
    currently running, and if enable or disable, then charging
    state will be {action}d based on the format specified by
    the format string.

    The format string will be '{level}%' if {action}ing until
    the 'level' is hit, or '{time}s', '{time}m' or '{time}h'
    to {action} charging until 'time' seconds, 'time' minutes
    or 'time' hours have passed respectively.

    [--mkdaemon] [start/stop]

    Start or stop the blex daemon manually. It will start or
    stop the daemon as per the first argument.

    If an argument is not given, it will start the daemon.

    [--configure]

    Configure blex' kernel communication interface.

    [--restat]

    Reset battery statistics on demand. Useful in recalibraing
    the battery, should only be used once a month.

    [--info]

    Print information about current battery state, settings of
    blex and whether the daemon is running or not.

    [--help]

    Print this HELP page and exit.
```

## Examples

* blex --enforce --update switch 99
* blex --detach --manual disable 1%
* blex --skip-logs --configure

* blex --update switch 80 60
* blex --update switch 85
* blex --update power 15
* blex --update switch
* blex --update
* blex --toggle switch ON
* blex --toggle power OFF
* blex --toggle switch
* blex --toggle
* blex --manual enable 1h
* blex --manual disable 30m
* blex --manual enable 90%
* blex --mkdaemon start
* blex --mkdaemon stop
* blex --mkdaemon
* blex --configure
* blex --restat
* blex --info
* blex --help

## Support

* ISSUE: Device spontaneously reboots while configuring.
* SOLUTION: Configure blex again after the device rebooted.

* ISSUE: blex stops working after flashing some kernel.
* SOLUTION: Reconfigure blex using 'blex --configure'.

* NOTE: Resetting batterystats might not work for all devices.

* If you experience any issue while installing, please share
  about that in either the 'Support Thread' (see 'Links') or
  'Telegram Group' (again, 'Links') and remember to attach
  the '/dev/blex_install.log' logfile.

* If you experience any issue with the daemon or CUI, write
  about that in the thread or group and please attach logfiles
  placed in the folder '/sbin/.core/img/blex/log' if Magisk
  install, or in '/data/adb/blex/log' for standard install.

* All the bug reports should be widely described and must have
  required (and relevant) logs.

* If you're a developer willing to contribute, please do so
  by creating PRs at my personal GitHub fork of blex.

* I'm a college first-year student who does it all as a hobby
  to help others, so if I helped you, kindly use the 'Thanks'
  button on the XDA Support Thread.

## Credits

* @topjohnwu for Magisk.
* @osm0sis for his BusyBox binary.
* Every blex/mcc beta tester :)

## Changelog

#### 0.2

* Add examples for supported actions.
* Symlink BusyBox applets instead of hardlinking.
* Revert manual methods regardless of Auto Switch.
* Check control file content before writing.
* Filter out Changelog from [--help] output.
* Update to osm0sis' BusyBox 1.29.3.
* Update documentation.

#### 0.1.4

* Limit charging state changes to only two.
* Fix unwanted output when checking for daemon.

#### 0.1.3.3

* Minor README fix.

#### 0.1.3.2

* Fix daemon not running issues.

#### 0.1.3.1

* Fix daemon detections.

#### 0.1.3

* Fix [--mkdaemon] reporting failure.
* Rewrite README.

#### 0.1.2.1

* Fix the daemon can not be launched.

#### 0.1.2

* Fix CLI not recognizing the daemon.
* Fix [--mkdaemon] always starting daemon.
* Update strings.

#### 0.1.1

* blex is no longer in beta stage!

* Fix configuring for lazy kernel events.
* Fix detecting running processes.
* Fix daemon checking in [--mkdaemon].
* Fix manual methods detection.
* Fix stopping multiple methods.
* Prevent running multiple daemons.
* Minor UI update.

#### 0.1.beta

* Please remove any version of mcc before installing this.

* Rework as 'Battery Life Extender (blex)'.
