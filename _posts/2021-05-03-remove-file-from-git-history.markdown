---
layout: post
title:  "Remove file from git history"
date:   2021-05-03 13:52:00 +0100
---

There is a file that was pushed to git, long time ago. It was changed and changed. But there was sensitive content on that file. We need to remove this file and remove it from git history.

We are going to use [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/) to help us on this task.

Lets clone (mirror):
```
git clone --mirror https://path/to/your-repo.git
``` 

Make a backup:
```
cp -r your-repo.git your-repo-backup.git 
```

Remove selected file by name:
```
java -jar bfg.jar --delete-files [filename] --no-blob-protection your-repo.git
```

Now lets go to our repo folder:
```
cd your-repo.git
```

Expire and prune the repo:
```
git reflog expire --expire=now --all && git gc --prune=now --aggressive
```

And push
```
git push
```