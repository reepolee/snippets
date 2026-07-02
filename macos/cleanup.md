```bash
sudo rm -rf /System/Volumes/Data/private/var/db/powerlog/Library/PerfPowerTelemetry/
sudo launchctl stop com.apple.powerlog

sudo rm -rf ~/Library/Caches/*

mdutil -i off /
mdutil -i on /

```
