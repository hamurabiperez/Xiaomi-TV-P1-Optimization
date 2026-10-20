# Originality, attribution, and differences

## Starting point

The inspiration was a general trend: using an AI coding assistant to make Android TV interfaces cleaner and more controllable. No particular Claude TV modification project was used as a codebase or tested as a benchmark. **An AI assistant is a tool in the workflow, not a performance result in itself.**

## What already existed

| Existing solution or idea | Attribution |
|---|---|
| Device connection and package diagnostics | Android Debug Bridge (ADB), part of Google's Android tooling |
| Alternative television home screen | [Projectivy Launcher](https://github.com/spocky/miproja1), an independent third-party app |
| Playback, app and screensaver settings | Built-in Android TV / Xiaomi capabilities |
| Polished open-source README presentation | Visual-documentation inspiration from [Harness²](https://github.com/google-research/harness2); no code or graphical assets taken from it |

## What was added in this case study

| Contribution | Evidence or limits |
|---|---|
| Baseline-first, human-approved sequence | Package/process/storage inventory before any changes; stop-and-approve workflow |
| Extraordinary Play Store cache detected and safely cleared | Manual cache-only operation; /data free space rose by 7.093 GiB on this TV; not a typical or guaranteed result |
| Isolated assessment of launcher deactivation | Same-boot Projectivy comparison: +63.54 MiB available RAM; no meaningful CPU change established |
| Recovery-forward integration | Stock Google Launcher disabled only for user 0, APK retained; PatchWall and shared services left intact |
| Functional regression checks | HOME, two reboots, main app launches, Xbox HDMI3 picture/sound, Chromecast and real sleep/wake verified |
| Honest negative findings | Recurrent recommendations/screensaver error; seven other candidate packages *not* disabled; antenna and certain HDR scenarios remain untested |
| Picture and sound review | Chosen SDR Movie and game/audio modes documented; HDR reverted; no instrument-based calibration claim |
| Privacy-aware publication | New read-only diagnostic helper and curated docs; no raw personal ADB exports or execution scripts copied from the working folder |

## What this repository is not

It is **not** a custom ROM, a newly developed launcher, an automatic one-click debloater, proof of compatibility with other TVs, or a claim that Codex/Claude alone made the TV faster. Results can differ across firmware versions and household conditions.

## Ownership and credits

Device testing and project decisions: [@hamurabiperez](https://github.com/hamurabiperez), with AI-assisted analysis, drafting and tooling. Projectivy, Android TV and all third-party components retain their own ownership and licenses. Presentation inspiration is not a software dependency or an affiliation.
