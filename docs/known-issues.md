# Known issues and negative results

## Recurrent recommendation-service crash during screensaver start (unresolved)

**Observed:** `com.google.android.tvrecommendations` invokes `com.google.android.tvlauncher/.BootHelperEmptyActivity`, which is unavailable when `com.google.android.tvlauncher` is disabled. A resulting `ActivityNotFoundException` / process crash has been observed repeatedly.

The event `android.intent.action.DREAMING_STARTED` triggers a shared receiver path. Screensaver choices **Clock**, **Colors** and **Mi Wallpapers** displayed their content but each reproduced the failure. Returning to the original **Google Backdrop** with the original 5-minute idle setting did not eliminate the underlying launcher dependency. Google Backdrop was retained to avoid compromising burn-in/idle protection.

**What this does *not* mean:** the stock launcher is still running, CPU is necessarily being wasted, or disabling the entire recommendations package is safe. No persistent CPU impact was demonstrated during the three observation windows.

**Do not** treat a different DreamService as a verified fix. Disabling `com.google.android.tvrecommendations` was deliberately **not performed**, due to notification/channel/screensaver dependencies. Restoring the stock launcher may change the observed behavior, but this was not tested as a fix after migration.

## Remote control

A prior intermittent remote-control issue was documented. It did not reproduce in final checks, including waking from real suspension and navigation. A causal link to Projectivy accessibility is **not established**. Users with remote/gamepad input problems should re-check accessibility settings and retain an ADB recovery path.

## Testing still pending

- Antenna reception without an antenna cable
- Real Xbox gameplay/input latency
- Prime Video and Disney+ content-specific A/V synchronization
- Dolby Vision/HDR10+ verified signal playback
- Xbox HDMI3 HDR capabilities under a known signal chain
- Same-content 1080p vs. 2160p60 controlled playback comparison

Use the upstream [Projectivy Launcher](https://github.com/spocky/miproja1) issue tracker for upstream behavior. Do not submit diagnostic logs containing private identifiers without sanitizing them.
