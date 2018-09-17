###### Battery Life Extender
###### JayminSuthar @ xda-developers

###### Copyright (c) 2018 Jaymin Suthar. All rights reserved.

## Legal

* This file is a part of "Battery Life Extender (blex)".

* blex is release under the terms of GNU GPL v3 as published
  by the Free Software Foundation. And you hereby are allowed
  to use, modify or redistribute it, either pieces of it or
  entirely under v3 or any later version of the GPL.

* blex is developed in a hope of being useful, but neither
  warranty nor support are provided with it, not even fitness
  for the particular purpose. See the GPLv3 for details.

* A copy of GPLv3 (COPYING) is placed in the root folder of
  blex which can also be found at <https://www.gnu.org/licenses/>.

## Links

* [Git Repository](https://github.com/Magisk-Modules-Repo/Battery-Life-Extender)
* [Support Thread](https://forum.xda-developers.com/apps/magisk/mcs-charging-controller-t3739371)

## Intro

* #### blex extends/maintains batteries' life with some fun.

## Details

* Well, there have been many articles about how to extend or
  maintain lithium batteries' life long enough that I didn't
  read neither entirely, but I actually went on to develop a
  nice tool that could help users achieve that Automated and
  reliably, and that, is blex.

* blex provides you an Automation consisting of two features
  'Auto Switch' and 'Auto Power'. Auto Switch depends on two
  settings, thr_disable and thr_enable to disable and enable
  charging. The purpose of it is to make the circuit not get
  away from our specified limits, this is to basically let a
  consistent charge cycle be maintained which is recommended
  if you need the battery to long last, and it really is too
  good on that as counted against total charge cycles. So it
  will disable charging when the disable threshold is hit to
  enable it back when the enable threshold is hit. The other
  Auto Power, uses thr_power to power the device off. Reason
  for this is just that, to not let drain battery so much as
  it might harm it bringing back to life. So it'll power the
  device off when power threshold is hit.

* blex also has manual methods to enable/disable charging on
  demand, and [--restat] to reset battery statistics. Others
  and these, everything is described well in CLI section.

## Prereqs

* An arm-based chipset.
* Basic terminal/CLI knowledge.
* (if Magisk install) Magisk v14.6+.
* (otherwise) Any root solution.
* (otherwise) Init.d support.

## Install

* blex can be installed either in Magisk or system mode. The
  difference is that Magisk mode does not modify the system,
  whereas the other one does (possibly making the device un-
  bootable). Flash the zip from Magisk Manager or a recovery
  and the installer will detect Magisk install to install in
  Magisk mode, otherwise system mode. Note that if Magisk is
  older, it will install in system mode. Files will be saved
  inside the image if Magisk install, else /data/adb/blex is
  used.

## Setup

* After installing, you must run 'blex --configure' to setup
  blex' kernel interface configs, otherwise blex is useless.
  This is required only once after install/upgrade. Also set
  Automation features and/or their thresholds to have a nice
  set-and-forget concept, though default settings should may
  great enough, they are my personal settings so far. I will
  recommend not enforcing thresholds to serve the purpose in
  a better and efficient manner.

## Usage

* The blex daemon will be launched at boot by the boot scrip
  that handles all the core runtime functionalities. But you
  will still need a CLI to configure it, setup Automation or
  have manual methods running on. You will need to install a
  terminal (like Termux). Launch the terminal and write 'su'
  to have root access, then 'blex [flags] [options] args' is
  what you need. Note to not run multiple blex processes and
  also note that everything is checked and defaulted, so use
  it wisely.

## CLI

* Flags

    [--detach]

    Detach blex from the terminal so that it can run as some
    background process. Useful when running manual methods.

    [--skip-logs]

    Skip logging blex command execution tree and errors to a
    log file. Useful for preserving 'em and manual methods.

    [--enforce]

    Enforce any valid threshold (1-99) and do not abort such
    operations, can even keep battery level constant. Useful
    only when you're sure you're not doing some wrong math.

    Note that [--detach] must be the first, [--skip-logs] be
    the second and [--enforce] be the third flag in order to
    let blex recognize them.

* Options

    [--update] [switch/power] [disable/power] [enable]

    Update Automation thresholds from arguments or revert if
    no arguments provided. [switch/power] determines feature
    to update thresholds of followed by the thresholds them-
    selves. Args will be validated by blex by default unless
    the [--enforce] flag is given. It will also think enable
    threshold (of Auto Switch) out if that's not given. Also
    thresholds for a feature will be reverted if they're not
    given, and all thresholds will be reverted if no feature
    is specified.

    [--toggle] [switch/power] [ON/OFF]

    Toggle Automation features from argument or revert if no
    argument provided. [switch/power] determines feature may
    toggle and [ON/OFF] determines which state to toggle the
    same to. The feature state will be inverted if ON or OFF
    is not specified, and both features will be reverted for
    them be not specified.

    [--manual] [enable/disable/stop] [level/time]

    Enable or disable charging, until provided battery level
    is reached or some specified time has passed. First arg,
    [enable/disable/stop] determines whether to stop/enable/
    disable manual methods followed by a format string. Both
    arguments are required if not [stop], otherwise a single
    will work. [stop] will stop any methods running, whereas
    [enable/disable] will enable/disable charging. It recog-
    nizes format '{level}%' to run until level and '{time}s'
    or '{time}m' or '{time}h' to run as time passes.

    [--mkdaemon] [start/stop]

    Start or stop the blex daemon, useful in cases where the
    daemon launched by boot scrip can't be maintained in the
    context inherited, though very rare. If [stop] is given,
    it will stop the running daemon, and if [start], it will
    start the daemon. It will by default assume [start] when
    argument is not given.

    [--configure]

    Configure blex' kernel interface. It should be used only
    once after installing or upgrading blex, or if you flash
    a different kernel. It has a special workaround for some
    devices described in the Support section below.

    [--restat]

    Reset battery statistics. It is meant as an utility that
    should be used only once in a month or more, useful only
    for recalibrating the battery. Note that it might not be
    functional on some older/intermediate devices.

    [--info]

    Print some information about current battery state, blex
    settings and whether the daemon is running or not.

    [--help]

    Print this HELP page.

## Support

* If the device rebooted while configuring, re-run the setup
  to enable a workaround for that. If the issue persists, or
  you have any other issues or bug reports, visit the thread
  at XDA (see Links->Support Thread). Please describe widely
  and provide relevant logs to ease out debugging. You might
  also mention me so that I do not miss your post. If you're
  willing to contribute, do so by creating PRs at my private
  repo (see my GitHub profile). blex is developed in my free
  time, so if it is useful to you, do thank me on the thread
  please!

## Credits

* @topjohnwu for BusyBox and Magisk.
* Every blex/mcc beta tester :)

## Changelog

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
