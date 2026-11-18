# Quick Start - Fortnite 13.40 on iOS 13.4

## TL;DR

1. **Build**: Push to GitHub → Download artifact from Actions
2. **Inject**: Use Sideloadly to inject `libmidnight.dylib` into Fortnite 13.40 IPA
3. **Install**: Sideload to iOS 13.4 device
4. **Play**: Launch Fortnite

## 60-Second Setup

```bash
# 1. Commit and push (triggers auto-build)
git add .
git commit -m "iOS 13.4 build"
git push origin iOS

# 2. Download artifact from GitHub Actions

# 3. Inject into Fortnite IPA using Sideloadly

# 4. Install and play!
```

## What This Does

- Redirects Fortnite network traffic to: `http://209.25.140.16:31717`
- Intercepts Epic Games API calls
- Routes them to custom backend
- Enables iOS play on Season 13.40

## Requirements

✓ iOS 13.4 device
✓ Fortnite 13.40 IPA
✓ Sideloadly (or similar)
✓ Apple ID

## Verify It's Working

When you launch Fortnite, the dylib auto-loads and redirects traffic. You should be able to:
- ✓ Reach login screen
- ✓ Authenticate
- ✓ Connect to matches
- ✓ Play normally

## Need Help?

- **Full Guide**: See `FORTNITE_1340_GUIDE.md`
- **Backend Config**: See `BACKEND_SETUP.md`
- **Build Issues**: Check GitHub Actions logs

## One-Command Build (macOS only)

```bash
./build.sh
# Output: build/libmidnight.dylib
```

That's it! 🎮
