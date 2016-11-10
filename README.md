# EZSwiftExtensions

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)  
[![License](https://img.shields.io/cocoapods/l/EZSwiftExtensions.svg?style=flat)](https://cocoapods.org/pods/EZSwiftExtensions)
[![Platform](https://img.shields.io/cocoapods/p/EZSwiftExtensions.svg?style=flat)](http://cocoapods.org/pods/EZSwiftExtensions)
[![Language](https://img.shields.io/badge/swift-3.0-orange.svg)](http://swift.org)
[![Language](https://img.shields.io/badge/swift-2.3-orange.svg)](http://swift.org)
 [![CocoaPods](https://img.shields.io/cocoapods/dm/EZSwiftExtensions.svg)](https://cocoapods.org/pods/EZSwiftExtensions)

[![Build Status](https://travis-ci.org/goktugyil/EZSwiftExtensions.svg?branch=master)](https://travis-ci.org/goktugyil/EZSwiftExtensions)
[![codecov.io](https://codecov.io/gh/goktugyil/EZSwiftExtensions/branch/master/graphs/badge.svg)](https://codecov.io/gh/goktugyil/EZSwiftExtensions/branch/master)

<img src="charizard.png" width="200">

How Swift standard types and classes were supposed to work. A collection of useful extensions for the Swift Standard Library, Foundation, and UIKit.

- [Gitter chat room](https://gitter.im/EZSwiftExtensions/Lobby)

##Usage

``` swift
- Examples here
```

##Installation

### Manually (~10 seconds)

1. Download and drop '/Sources' in your project.  
2. Congratulations!  

### Install via CocoaPods (~10 seconds)

You can use [CocoaPods](http://cocoapods.org/) to install `EZSwiftExtensions` by adding it to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!
pod 'EZSwiftExtensions' #Stable release for Swift 3.0

pod 'EZSwiftExtensions', :git => 'https://github.com/goktugyil/EZSwiftExtensions.git' #Latest release for Swift 3.0
pod 'EZSwiftExtensions', :git => 'https://github.com/goktugyil/EZSwiftExtensions.git', :branch => 'Swift2.3' #For Swift 2.3
pod 'EZSwiftExtensions', '~> 1.6' #For Swift 2.2
```

To get the full benefits import `EZSwiftExtensions` wherever you import UIKit

``` swift
import UIKit
import EZSwiftExtensions
```

### Install via [Carthage](https://github.com/Carthage/Carthage)

Create a `Cartfile` that lists the framework and run `carthage bootstrap`. Follow the [instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios) to add `$(SRCROOT)/Carthage/Build/iOS/EZSwiftExtensions.framework` to an iOS project.

```
github "goktugyil/EZSwiftExtensions"
```

## Requirements

- Swift 2 or later

## Possible features

- More extensions! Please if there is an extension you are constantly using, send a pull request now!
- Fancy pictures and jpgs in documentation.
- Documentations inside code 
- List of contents inside readme
- Completing `TODO`s in source code.
- OSX compatibility and add here https://github.com/AndrewSB/awesome-osx

## Sources Used

- [ExSwift by pNre](https://github.com/pNre/ExSwift)
- [SKTUtils by raywenderlich](https://github.com/raywenderlich/SKTUtils)
- [CEMKit-Swift by cemolcay](https://github.com/cemolcay/CEMKit-Swift)
- [SwiftySwift by adeca](https://github.com/adeca/SwiftySwift)
- [Geometry by artman](https://github.com/artman/Geometry)
- [Swift-Extensions by vitkuzmenko](https://github.com/vitkuzmenko/Swift-Extensions)
- [SwiftTweetGettr by jmenter](https://github.com/jmenter/SwiftTweetGettr)
- [Basics by dennisweissmann](https://github.com/dennisweissmann/DeviceKit)
- [toNumber by Mamesoft](https://github.com/Mamesoft/toNumber)
- [RBResizer by hcatlin](https://gist.github.com/hcatlin/180e81cd961573e3c54d)

And countless gists and stackoverflow answers.

## License
EZSwiftExtensions is available under the MIT license. See the [LICENSE file](https://github.com/goktugyil/EZSwiftExtensions/blob/master/LICENSE).

## Keywords
swift, extension, uikit, exswift, foundation, library, framework, tool
