---
layout: post
title:  "Quick Remider: Xamarin - MSBuild Perfomance Summary"
date:   2019-01-15 20:10:00 +0000
---

Is your Xamarin project taking a long time to build? Check which process is taking longer with Performance Summary:

`msbuild yourDroidOrIOS.csproj /clp:PerformanceSummary`

Most of the time is Aapt (on Xamarin Android) because of huge png files.