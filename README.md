# checkout-3ds-sdk-ios-framework

Releases for CheckoutEventLoggerKit

## Requirements

- iOS 10.0+
- Xcode 11.0+
- Swift 5.0+

## Installation

### Cocoapods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.9+ is required to use CheckoutEventLoggerKit

To integrate CheckoutEventLoggerKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'CheckoutEventLoggerKit', :git => 'https://github.com/checkout/checkout-3ds-sdk-ios-framework.git', :tag => '1.0.0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

> Carthage 0.37+ is required to use CheckoutEventLoggerKit

To integrate CheckoutEventLoggerKit into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
binary "https://github.com/checkout/checkout-sdk-event-logger-ios-release/raw/main/CheckoutEventLoggerKit.json" ~> 1.0.0
```

Run `carthage update` to download the framework and drag the binary for `CheckoutEventLoggerKit` into your Xcode project.

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the swift compiler.

Once you have your Swift package set up, adding CheckoutEventLoggerKit as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```
dependencies: [
    .package(url: "https://github.com/checkout/checkout-3ds-sdk-ios-framework.git", .upToNextMajor(from: "1.0.0"))
]
```

## Usage

### Initialisation

First, initialise the logger with your product name

```swift
import CheckoutEventLoggerKit

let logger = CheckoutEventLogger(productName: "my-sdk-name")
```

Next, enable the logging methods you require for your SDK

```swift
// for logging to console
// - note that monitoringLevel is the minimum logging level
logger.enableLocalProcessor(monitoringLevel: .debug)

// for logging to checkout middleware
logger.enableRemoteProcessor(environment: logEnvironment,
                             remoteProcessorMetadata: .init(productIdentifier: sdkBundle.bundleIdentifier!,
                                                            productVersion: sdkBundle.infoDictionary!["CFBundleShortVersionString"] as! String,
                                                            environment: "sandbox",
                                                            appPackageName: appBundle.bundleIdentifier!,
                                                            appPackageVersion: appBundle.infoDictionary!["CFBundleShortVersionString"] as! String,
                                                            appInstallId: appInstallId ?? "",
                                                            deviceName: UIDevice.current.modelName,
                                                            platform: "iOS",
                                                            osVersion: UIDevice.current.systemVersion))
```

Then log events safely and securely from your SDK

```swift
logger.log(event: Event(typeIdentifier: "example-event-identifier",
                        time: Date(),
                        monitoringLevel: .debug,
                        properties: ["test": "value",
                                     "number": 123])
```