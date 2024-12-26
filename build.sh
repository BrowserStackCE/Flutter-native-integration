output="../build/ios_integration"
product="build/ios_integration/Build/Products"
# Pass --simulator if building for the simulator.
flutter build ios integration_test/app_test.dart --release
pushd ios
xcodebuild -workspace Runner.xcworkspace -scheme Runner -config Flutter/Release.xcconfig -derivedDataPath $output -sdk iphoneos build-for-testing
popd
pushd $product
# Provide the xctestrun filename present at build output path build/ios_integration/Build/Products. eg. Runner_iphoneos16.2-arm64.xctestrun
zip -r "com.khunsha.flutterNative.zip" "Release-iphoneos" "Runner_iphoneos16.4-arm64.xctestrun"
popd

#./build.sh