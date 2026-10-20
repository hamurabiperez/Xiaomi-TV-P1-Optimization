# Privacy boundaries and release hygiene

The source project contained private ADB logs, screenshots, full package/process dumps, network statistics, local script paths and sensitive device/account identifiers. **They are excluded** from this curated public repository.

Do not commit:
- Private IPs, MAC/BSSID, SSID, device serial, Android ID, account/email or pairing secrets.
- Local home directories/paths or raw output from `dumpsys`, `logcat`, network or account commands.
- Unreviewed screenshots: they may reveal app profiles, watched content, network identifiers or personal information.
- ADB certificates, tokens, credentials, private keys, shell history or internal telemetry.

The optional diagnostic script writes output in a user-chosen **local folder**. That folder is ignored by `.gitignore`; the script never uploads or shares it. Review manually before reporting bugs.

The branded graphics are original generic SVG drawings and do not reproduce television screenshots or third-party artwork.

**For every future contribution:** review each file for private information and credentials before committing. Removing a secret in a later commit does not remove it from historical clones.
