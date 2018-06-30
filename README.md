# EZSwiftExtensions

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)  
[![License](https://img.shields.io/cocoapods/l/EZSwiftExtensions.svg?style=flat)](https://cocoapods.org/pods/EZSwiftExtensions)
[![Platform](https://img.shields.io/cocoapods/p/EZSwiftExtensions.svg?style=flat)](http://cocoapods.org/pods/EZSwiftExtensions)
[![Language](https://img.shields.io/badge/swift-4.0-orange.svg)](http://swift.org)
[![Language](https://img.shields.io/badge/swift-3.0-orange.svg)](http://swift.org)
[![Language](https://img.shields.io/badge/swift-2.3-orange.svg)](http://swift.org)

<p>
<a href="http://cocoapods.org/pods/EZSwiftExtensions"><img src="https://img.shields.io/cocoapods/at/EZSwiftExtensions.svg?label=Apps%20Using%20EZSwiftExtensions&colorB=28B9FE"></a>
<a href="http://cocoapods.org/pods/EZSwiftExtensions"><img src="https://img.shields.io/cocoapods/dt/EZSwiftExtensions.svg?label=Total%20Downloads&colorB=28B9FE"></a>
<a href="http://cocoapods.org/pods/EZSwiftExtensions"><img src="https://img.shields.io/cocoapods/dm/EZSwiftExtensions.svg?label=Downloads&colorB=28B9FE"></a>
</p>

[![Build Status](https://travis-ci.org/goktugyil/EZSwiftExtensions.svg?branch=master)](https://travis-ci.org/goktugyil/EZSwiftExtensions)
[![codecov.io](https://codecov.io/gh/goktugyil/EZSwiftExtensions/branch/master/graphs/badge.svg)](https://codecov.io/gh/goktugyil/EZSwiftExtensions/branch/master)
[![MIT](https://img.shields.io/badge/License-MIT-red.svg)](https://opensource.org/licenses/MIT)

<img src="charizard.png" width="200">

How Swift standard types and classes were supposed to work. A collection of useful extensions for the Swift Standard Library, Foundation, and UIKit.

Join our online chat at [![Gitter](https://badges.gitter.im/gitterHQ/gitter.svg)](https://gitter.im/EZSwiftExtensions/Lobby)
- [Full Documentation via CocoaDocs](http://cocoadocs.org/docsets/EZSwiftExtensions/)

## Example Usage

Easily get an object at a specified index:
``` swift
var myArray = ["charmander","bulbasaur","squirtle"]
print(myArray.get(1)) // "bulbasaur"
```
Easily access a random element:

``` swift
var myArray = ["charmander","bulbasaur","squirtle"]
print(myArray.random()) // bulbasaur or something else
```

Easily find the indexes of an object:
``` swift
var myArray = ["charmander","bulbasaur","squirtle","charmander"]
print(myArray.indexesOf("charmander")) // [0,3]
```
Easily check if an array contains another array:
``` swift
var myArray = ["charmander","bulbasaur","squirtle"]
print(myArray.containsArray(["charmander","bulbasaur"])) // true
print(myArray.containsArray(["string"])) // false
```
Block Objects
These objects use completion blocks instead of selectors, taken from: CEMKit-Swift
Easily initialize a BlockButton:
``` swift

let button = BlockButton(x: 0, y: 0, w: 100, h: 100) { (sender) -> Void in
    print("Block button clicked!")
}
let button1 = BlockButton(x: 0, y: 0, w: 100, h: 100)
button1.addAction { (sender) -> Void in
    print("Block button clicked!")
}

// There are also BlockWebView, BlockTap, BlockPan, BlockSwipe, BlockPinch, BlockLongPress
```

Easily convert between different types:
``` swift
var myCGFloat = myInt.toCGFloat
var myString = myInt.toString
var myDouble = myString.toDouble
var myInt = myDouble.toInt
```
Easily toggle it:
``` swift
var myBool: Bool = true
print(myBool.toggle()) // false
```
Easily initialize your objects:
``` swift
let myView = UIView(x: 0, y: 0, w: 100, h: 100)
print(myView.frame) // (0.0, 0.0, 100.0, 100.0)
```
Easily access your ViewController on top of your view stack:
``` swift
ez.topMostViewController?.presentViewController(myAlertController, animated: true, completion: nil)
// topMostViewController is your rootViewController
// Intended for showing small VCs like UIAlertControllerstring.length, string.capitalizefirst, string.trim, string.isemail, 
```
Easily initialize your colors:
``` swift
let myColor = UIColor(r: 100, g: 100, b: 100) // Default alpha is 1
```
Easily run block of codes after a certain delay:
``` swift
Timer.runThisAfterDelay(seconds: 2) { () -> () in
    print("Prints this 2 seconds later in main queue")
}
```
Easily run code every seconds:
``` swift
var count = 0
Timer.runThisEvery(seconds: 1) { (timer) -> Void in
    print("Will print every second")
    if count == 3 {
        timer?.invalidate()
    }
    count += 1
}
```
Easily access your projects version and build numbers:
``` swift
print(ez.appVersion) // 0.3
print(ez.appBuild) // 7
print(ez.appVersionAndBuild) // v0.3(7)

Easily track screen shots:
ez.detectScreenShot { () -> () in
    print("User took a screen shot")
}
```

## Installation

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
