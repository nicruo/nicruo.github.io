---
layout: post
title:  "Quick Reminder: Vellemen VMP402 with Raspberry Pi 4B"
date:   2020-01-31 12:25:00 +0000
---

On the Raspberry Pi 4B, add to the end of the file `/boot/config.txt`:

```
max_usb_current=1
hdmi_group=2
hdmi_mode=87
hdmi_cvt 800 480 60 6 0 0 0
hdmi_drive=1
```
and comment the line

```
dtoverlay=vc4-fkms-v3d
```

Result:

```
#dtoverlay=vc4-fkms-v3d
```