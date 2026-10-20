# Recover stock Android TV HOME (technical, manual procedure)

> [!CAUTION]
> This procedure is intended for a trusted, ADB-authorized connection to the **same class of Android TV 10 setup** documented here. If Android version, package names or access state differ, **stop** and inspect rather than trying generic commands. Never run recovery blindly after changing firmware.

## Prerequisites

- Physical access to TV and remote; TV awake and on the same **trusted local network** as your computer.
- Your own ADB installation (for example Google's official Platform-Tools) and **on-screen ADB authorization**.
- Confirm package ID and username/user ID for *your device*. The reference case used user **0**.
- Record your current enabled accessibility services **before modifying them**; other services may be important.

## Read-only checks

Run manually from your Windows terminal, replacing `<TV_IP>` with your actual local address (never put it into a public issue or commit):

```powershell
adb connect <TV_IP>:5555
adb -s <TV_IP>:5555 get-state
adb -s <TV_IP>:5555 shell am get-current-user
adb -s <TV_IP>:5555 shell pm list packages -d
adb -s <TV_IP>:5555 shell cmd package resolve-activity --brief -a android.intent.action.MAIN -c android.intent.category.HOME
adb -s <TV_IP>:5555 shell settings get secure enabled_accessibility_services
```

The last command may include private app names. Keep outputs local.

## Manual rollback approach

1. In **Projectivy settings**, turn off automatic launcher overrides/on-boot behavior and its *alternative* accessibility override. Do **not** disable unrelated accessibility services.
2. **Only if the stock package is confirmed present**, restore stock package state for the intended user:

```powershell
adb -s <TV_IP>:5555 shell pm default-state --user 0 com.google.android.tvlauncher
```

3. Verify that the package is no longer disabled and that its HOME activity exists. If the activity in your firmware is the same as this case, you can explicitly set it as HOME:

```powershell
adb -s <TV_IP>:5555 shell cmd package set-home-activity --user 0 com.google.android.tvlauncher/.MainActivity
adb -s <TV_IP>:5555 shell input keyevent KEYCODE_HOME
```

4. Recheck HOME, navigation, and launcher accessibility state. If the launcher cannot be resolved, **stop** rather than force-resetting or clearing app data.

This is an annotated reference. It is **not** shipped as an auto-run recovery script because even recovery actions depend on device state and enabled accessibility services. The original private recovery script was tested on the case-study device, but contained local paths and an IP address and **is intentionally excluded from this public repository**.
