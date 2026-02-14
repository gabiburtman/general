#!/bin/bash
# Build the APK locally
# Prerequisites: Node.js, Java 17+, Android SDK (or Android Studio)
set -e

echo "==> Installing dependencies..."
npm install

echo "==> Syncing web assets to Android..."
npx cap sync android

echo "==> Building debug APK..."
cd android
./gradlew assembleDebug

APK_PATH="app/build/outputs/apk/debug/app-debug.apk"
if [ -f "$APK_PATH" ]; then
  echo ""
  echo "==> APK built successfully!"
  echo "    $APK_PATH"
  echo ""
  echo "Transfer this file to your phone and install it."
  echo "(You may need to enable 'Install from unknown sources' in Settings)"
else
  echo "Build failed - check errors above"
  exit 1
fi
