# ANGLE-Builds

This is ANGLE-Builds, a series of scripts for Windows and Linux to help automate
building the [ANGLE](https://angleproject.org) library.

That said, these scripts are not necessarily meant for local use - we use these
to build ANGLE automatically via
[GitHub Actions](https://github.com/features/actions).

Currently we have actions to build ANGLE for Linux (64-bit), Windows (32-bit and
64-bit), UWP (64-bit), and Google Stadia (64-bit). You can see the status of our
builds at the bottom of this README.

## License

These scripts are released under the MIT license. See LICENSE.md for details.

## Automation

Build Event | Linux+GGP | UWP | Win32
----------- | --------- | --- | -----
Commit | [![Linux+GGP Commit](https://github.com/cybik/angle-bootstraps/workflows/Matrixed%20Linux%20Build/badge.svg?event=push)](https://github.com/cybik/angle-bootstraps/actions?query=workflow%3A"Matrixed+Linux+Build"+event%3Apush) | [![UWP Commit](https://github.com/cybik/angle-bootstraps/workflows/Matrixed%20UWP%20Build/badge.svg?event=push)](https://github.com/cybik/angle-bootstraps/actions?query=workflow%3A"Matrixed+UWP+Build"+event%3Apush) | [![Win32 Commit](https://github.com/cybik/angle-bootstraps/workflows/Matrixed%20Windows%20Build/badge.svg?event=push)](https://github.com/cybik/angle-bootstraps/actions?query=workflow%3A"Matrixed+Windows+Build"+event%3Apush)
Cron | [![Linux+GGP Cron](https://github.com/cybik/angle-bootstraps/workflows/Matrixed%20Linux%20Build/badge.svg?event=schedule)](https://github.com/cybik/angle-bootstraps/actions?query=workflow%3A"Matrixed+Linux+Build"+event%3Aschedule) | [![UWP Cron](https://github.com/cybik/angle-bootstraps/workflows/Matrixed%20UWP%20Build/badge.svg?event=schedule)](https://github.com/cybik/angle-bootstraps/actions?query=workflow%3A"Matrixed+UWP+Build"+event%3Aschedule) | [![Win32 Cron](https://github.com/cybik/angle-bootstraps/workflows/Matrixed%20Windows%20Build/badge.svg?event=schedule)](https://github.com/cybik/angle-bootstraps/actions?query=workflow%3A"Matrixed+Windows+Build"+event%3Aschedule)
