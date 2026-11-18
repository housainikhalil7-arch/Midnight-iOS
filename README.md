# Midnight - iOS

**Midnight - iOS** is a **NSURLProtocol** redirect that registers itself to the game and redirect every request from epicgames to a Hosted Custom Backend to give the ability to play on iOS.

## iOS 13.4 Support

This project is configured to target **iOS 13.4** specifically, making it compatible with devices running this version. The dylib uses the `-miphoneos-version-min=13.4` flag to ensure compatibility.

## Fortnite Version Support

- **Season 3.3 - 10.30**: Fully working
- **Season 13.40**: Compatible (iOS 13.4 optimized)
- **31.00+**: Experimental/Not tested

## Backend Configuration

The backend URL is set in `includes/opts.h`. Current backend:
```
http://209.25.140.16:31717
```

To use a different backend, edit this URL before building.

## Building

### Option 1: GitHub Actions (Recommended)
1. Fork this repository
2. Change the **BACKEND_URL** in `includes/opts.h` if needed
3. Push to the `iOS` branch
4. Download the compiled dylib from Actions artifacts

### Option 2: Build Locally (macOS with Xcode required)
```bash
chmod +x build.sh
./build.sh
```

Or on macOS with PowerShell:
```powershell
./build.ps1
```

The compiled `libmidnight.dylib` will be in the `build/` directory.

## Installation

1. Build or download the dylib
2. Use an IPA injection tool (e.g., Sideloadly, AltStore, or similar)
3. Inject `libmidnight.dylib` into your Fortnite IPA
4. Sign and install the modified IPA on your iOS 13.4 device

## How it works

The dylib intercepts network requests to Epic Games domains and redirects them to your custom backend server, allowing you to:
- Play on older Fortnite versions
- Use custom servers
- Bypass iOS restrictions

## Requirements

- iOS device running **iOS 13.4** (or compatible version)
- Fortnite IPA (Season 13.40 or earlier)
- IPA injection tool
- Custom backend server
