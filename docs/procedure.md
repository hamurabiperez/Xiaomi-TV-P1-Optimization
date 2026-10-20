# Documented intervention — not an automatic installer

This project documents what **was actually done**, not commands that every user should run.

## 1. Diagnose before changing anything

An ADB read-only baseline covered Android version, installed packages, process activity, available memory and disk statistics. Initial package inventory: **122**. Diagnostic logs are kept private because they may contain account/device identifiers.

## 2. Investigate the exceptional Play Store cache

Android's per-package storage statistics showed ~**7.09 GiB** cache for `com.android.vending`. The figure was independently compared with the TV settings display (~7.62 decimal GB). A **manual "Clear cache"** action was performed via the TV remote, not an ADB `pm clear` operation.

The space available on `/data` rose from **1,592,180,736 bytes** to **9,207,914,496 bytes**, a measured gain of **7,615,733,760 bytes** (7.093 GiB). The total occupied indication changed from **87% to 24%**.

Do not assume this cache anomaly exists on other TVs. **Clearing data is a different operation and was not authorized or performed.**

## 3. Adjust native Android TV home options

Disabled automatic video/audio previews, hid five promotional rows and reordered app favorites using the official interface. This improved presentation, not demonstrably CPU. The original launcher stayed present during this phase.

## 4. Install and assess Projectivy Launcher

Installed Projectivy 4.72 from the TV's own Google Play Store. Configured a dark static background and shortcuts to Netflix, Prime Video, Disney+ and YouTube. Kept the stock HOME in place during the initial tests. No root, firmware flash or package removal was needed.

## 5. Set Projectivy as HOME, retain recovery

Documented the original states and verified remote navigation, applications, HDMI3, the possibility of ADB recovery, and multiple reboots. Projectivy integration with its accessibility feature was explicitly authorized and tested. Only after validation, the stock launcher was **disabled for user 0**. The system APK and PatchWall-related components remained present.

Do not execute package-disable commands as part of an unattended installation. Review [recovery](recovery.md) and [known issues](known-issues.md) first.

## 6. Validate and stop when evidence no longer justifies changes

Chromecast and genuine sleep/wake passed. The recommendations service crash proved recurrent; alternatives to the screensaver did not fix it. Of seven package candidates, none justified further disabling given the risks. An audit of picture/audio settings followed, leaving the accepted SDR, gaming and sound modes and restoring HDR changes.

No further system package changes were performed.
