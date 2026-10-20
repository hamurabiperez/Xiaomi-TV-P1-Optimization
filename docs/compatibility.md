# Device and compatibility matrix

| Property | Tested device |
|---|---|
| TV | Xiaomi Mi TV P1, 55-inch |
| Android | Android TV 10 / API 29 |
| Firmware | `QTG3.200305.006.5135` |
| Kernel (observed) | `4.19.79+` |
| Projectivy | 4.72, installed from Google Play |
| Control method | ADB on a trusted home network, authorized on-screen |
| Privileges | No root or firmware modifications |
| HOME state | Projectivy active, stock `com.google.android.tvlauncher` disabled for user 0 |

This is a **single-device field report**. Other Xiaomi models, Google TV releases, Android 11+, versions of Projectivy, regional firmware, and custom ROMs **have not been validated**.

## Functional checks

| Function | Outcome | Note |
|---|---|---|
| HOME / two reboots | Passed | Projectivy remained the visible launcher |
| Netflix / Prime Video / Disney+ / YouTube / Play Store / Settings | App launch passed | Full playback and lip-sync across all apps not verified |
| Xbox on HDMI3 | Picture and sound passed | Actual gameplay latency not measured |
| Chromecast | Passed | End-user cast test confirmed |
| Sleep / wake | Passed | Real sleep cycle verified without reboot |
| Remote control | Worked at final checks | An earlier intermittent issue was not reproducible |
| TV antenna | **Not tested** | No antenna cable connected |
| Screensaver | **Known issue** | Recommendation-service crash reproduced |
| HDR/Dolby Vision/HDR10+ / 2160p60 | Partially tested / pending | Do not claim universal capability from marketing specs |

## Diagnostic script status

The optional PowerShell helper is provided as a read-only **example**. It was reviewed statically, but has not been execution-tested across Windows PowerShell/ADB installations or on a second TV. Run only after inspecting its commands and keep its output private.
