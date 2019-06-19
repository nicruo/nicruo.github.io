---
layout: post
title:  "Quick Reminder: Set Android Emulator DNS Server"
date:   2019-06-19 16:15:00 +1000
---

Go to your sdk emulator folder and run: 

`emulator -avd [name_of_emulator] -dns-server [dns_server]`

example:

`emulator -avd Nexus_5_API_28 -dns-server 8.8.8.8`

If you are on a Windows machine, you can use "emulator.exe".