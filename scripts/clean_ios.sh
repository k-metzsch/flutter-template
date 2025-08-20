#!/usr/bin/bash
cd ..
flutter clean
flutter pub cache repair
flutter pub get
cd ios/
rm -rf .symlinks/
rm -rf Pods
rm -rf Podfile.lock
pod cache clean --all
pod install
pod repo update
xcodebuild clean

