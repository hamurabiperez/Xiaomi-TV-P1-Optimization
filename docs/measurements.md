# Performance measurements and limitations

All results are from **one TV on one day**. They must not be interpreted as universal gains, formal benchmark results, or sustained CPU improvements.

## Storage recovery

| Measure | Before | After |
|---|---:|---:|
| `/data` available | 1,592,180,736 bytes (~1.48 GiB) | 9,207,914,496 bytes (~8.58 GiB) |
| Reported occupied | 87% | 24% |
| Net gain | — | **7,615,733,760 bytes (7.093 GiB)** |

Only Play Store's **cache** was cleared manually. Some incidental background activity can affect before/after free-space counts.

## Controlled launcher comparison

The best isolated comparison was made **while Projectivy was already visible**, in the **same boot and process lifecycle**, without its accessibility mode yet being active.

| Metric | Google launcher enabled | Google launcher disabled for user 0 |
|---|---:|---:|
| Median aggregate CPU | 18.71% | 18.38% |
| Android `MemAvailable` | 570.03 MiB | 633.57 MiB |
| Google Launcher PSS | 100.79 MiB | Not running |
| Projectivy PSS | 73.09 MiB | 84.76 MiB |

Thus, **+63.54 MiB available memory** was observed. The change in CPU was only **−0.33 percentage points**, not robust evidence of a meaningful CPU gain. PSS is not additive freed RAM. Additional memory observed at later rebooted/configured stages **cannot all be attributed** to disabling the old launcher.

## Sampling method

- HOME in foreground, without Settings or video playback; allowed roughly **60+ seconds to settle**.
- Three approximately **10-second intervals** from `/proc/stat` and `MemAvailable`, then a median.
- CPU aggregate across cores, excluding idle and iowait as documented in the original local tests.
- PSS obtained with `dumpsys meminfo` outside CPU interval sampling.
- Brief samples may be affected by app and system activity, thermals, and background caching.

Do not compare unrelated tests with different opened apps, launcher states or reboots and treat the differences as causal.

## Other observations

A later operational reference reported ~**8.79 GiB free** and around **779 MiB available memory**, but was measured after restart, accessibility configuration and additional activity; it is **not** the isolated A/B comparison. During investigation of the screensaver, CPU samples shifted from **16.99% to 18.41%** while RAM availability shifted; these samples do **not** establish a persistent regression.
