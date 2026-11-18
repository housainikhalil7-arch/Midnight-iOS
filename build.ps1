# PowerShell Build script for Midnight-iOS
# Note: This requires a macOS system with Xcode installed
# For Windows users, use GitHub Actions or WSL with macOS VM

Write-Host "Building Midnight-iOS for iOS 13.4..." -ForegroundColor Cyan

# Check if running on macOS
if ($IsMacOS -eq $false) {
    Write-Host "ERROR: This project requires macOS with Xcode to build." -ForegroundColor Red
    Write-Host ""
    Write-Host "Options:" -ForegroundColor Yellow
    Write-Host "1. Push to GitHub and let GitHub Actions build it automatically"
    Write-Host "2. Use a macOS system with Xcode installed"
    Write-Host "3. Use a cloud macOS build service"
    exit 1
}

# Create build directory
New-Item -ItemType Directory -Force -Path build | Out-Null

Write-Host "Compiling dylib..." -ForegroundColor Green

# Compile the dylib
& clang++ -dynamiclib `
  -std=c++17 `
  -x objective-c++ `
  -arch arm64 `
  -miphoneos-version-min=13.4 `
  -isysroot "$(xcrun --sdk iphoneos --show-sdk-path)" `
  -I includes `
  main.cpp src/protocol.cpp `
  -o build/libmidnight.dylib `
  -framework Foundation

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Build complete!" -ForegroundColor Green
    Write-Host "Output: build/libmidnight.dylib" -ForegroundColor Cyan
    Get-ChildItem build/libmidnight.dylib | Format-Table Name, Length, LastWriteTime
} else {
    Write-Host "✗ Build failed!" -ForegroundColor Red
    exit 1
}
