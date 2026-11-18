# Fortnite Season 13.40 on iOS 13.4 - Setup Guide

This guide will help you get Fortnite Season 13.40 working on iOS 13.4 using Midnight-iOS.

## Prerequisites

1. **iOS Device** running iOS 13.4
2. **Fortnite IPA** for Season 13.40
3. **IPA Injection Tool** (Sideloadly, AltStore, etc.)
4. **Computer** (Windows/Mac) for sideloading
5. **Apple ID** (free account works)

## Step 1: Build or Download Midnight

### Option A: Use GitHub Actions (Easiest)
1. Go to the **Actions** tab on GitHub
2. Find the latest successful build
3. Download the `Midnight-dylib` artifact
4. Extract `libmidnight.dylib`

### Option B: Build Locally (macOS only)
```bash
./build.sh
```
Find the dylib in `build/libmidnight.dylib`

## Step 2: Verify Backend Configuration

The backend URL in `includes/opts.h` should point to a working Fortnite backend server:
```cpp
constexpr const char *BACKEND_URL = "http://209.25.140.16:31717";
```

Make sure this backend is:
- Online and accessible
- Compatible with Fortnite Season 13.40
- Supporting iOS 13.4 clients

## Step 3: Inject Dylib into Fortnite IPA

### Using Sideloadly:
1. Open Sideloadly
2. Connect your iOS 13.4 device
3. Drag your Fortnite 13.40 IPA into Sideloadly
4. Click "Advanced Options"
5. Under "Inject dylibs/frameworks/bundles", click "+"
6. Select `libmidnight.dylib`
7. Enter your Apple ID
8. Click "Start"

### Using Other Tools:
- Extract the IPA
- Place `libmidnight.dylib` in the `Frameworks` folder
- Repackage and sign the IPA
- Install using your preferred method

## Step 4: Install on Device

1. Sideloadly will install automatically, OR
2. Use AltStore/other tool to install the modified IPA
3. Trust the certificate in Settings > General > Device Management

## Step 5: Launch and Test

1. Open Fortnite
2. The dylib will automatically redirect requests to the custom backend
3. You should be able to log in and play

## Troubleshooting

### App crashes on launch
- Verify the dylib was built for arm64
- Check that iOS deployment target is 13.4
- Ensure the IPA is properly signed

### Cannot connect to server
- Verify backend URL is correct
- Check that backend server is online
- Test backend connectivity from another device

### "Unable to sign in to your account for PlayStation Network"
- This is normal when using custom backends
- Try logging in with Epic account instead

### App won't install
- Check device iOS version (must be 13.4 or compatible)
- Verify certificate isn't expired
- Try revoking and re-signing

## Technical Details

### Redirected Domains
Midnight redirects these Epic Games domains to your custom backend:
- `ol.epicgames.com`
- `account-public-service-prod.ol.epicgames.com`
- `accounts.epicgames.com`
- `epicgames.com`
- `epicgames.dev`

### How It Works
The dylib registers a custom `NSURLProtocol` that intercepts network requests. When Fortnite makes a request to Epic's servers, the protocol handler redirects it to your custom backend while preserving the path and query parameters.

### Compatibility
- Built with C++17
- Targets arm64 architecture
- Minimum iOS version: 13.4
- Uses Objective-C runtime for dynamic protocol registration

## Notes

- This is for educational purposes
- Requires a custom backend server to function
- Only works with Fortnite versions that support iOS 13.4
- Season 13.40 was the last season officially available on iOS

## Support

If you encounter issues:
1. Check that all prerequisites are met
2. Verify the dylib was built correctly
3. Ensure backend server is compatible
4. Check device logs for crash information
