# EasyDefaults

[![CI Status](http://img.shields.io/travis/banxi1988/EasyDefaults.svg?style=flat)](https://travis-ci.org/banxi1988/EasyDefaults)
[![Version](https://img.shields.io/cocoapods/v/EasyDefaults.svg?style=flat)](http://cocoapods.org/pods/EasyDefaults)
[![License](https://img.shields.io/cocoapods/l/EasyDefaults.svg?style=flat)](http://cocoapods.org/pods/EasyDefaults)
[![Platform](https://img.shields.io/cocoapods/p/EasyDefaults.svg?style=flat)](http://cocoapods.org/pods/EasyDefaults)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

EasyDefaults is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "EasyDefaults"
```

## Usage Example

```swift
import EasyDefaults

struct  MWebSettings{
static var baseFont = Default<String>("baseFont", defaultValue:"Menlo")
static var baseFontSize = Default<Int>("baseFontSize", defaultValue:15)
static var lineSpacing = Default<Int>("lineSpacing", defaultValue: 1)
static var transNewLinesToBR = Default<Bool>("transNewLinesToBR", defaultValue: true)
static var enableTOC = Default<Bool>("enableTOC", defaultValue: false)
static var autoScrollingThresholdPercent = Default<Double>("autoScrollingThresholdPercent", defaultValue: 60.0)
static var someThresholdPercent = Default<Float>("someThresholdPercent", defaultValue: 50.0)

//
//expect(MWebSettings.baseFont.optionalValue)  == "Menlo"
//expect(MWebSettings.baseFontSize.value)  == 15
//expect(MWebSettings.enableTOC.value)  == false
//expect(MWebSettings.transNewLinesToBR.value) == true
//

static var avatarUrl = Default<URL>("avatar")
static var favoriteFruits = Default<[String]>("favoriteFruits")
static var favoriteNumbers = Default<[Int]>("favoriteNumbers")
static var secretData = Default<Data>("secretData")
static var lastUpdateDate = Default<Date>("lastUpdateDate")
static var dateArray = Default<[Date]>("dateArray")
static var dataArray = Default<[Data]>("dataArray")
static var importNamedDate = Default<[String:Date]>("importNamedDate")
static var cachedData = Default<[String:Data]>("cachedData")
}
```

**Note**
as for `Double`,`Int`,`Float`, and `Bool` it always return not Optional Value. even if you use `optionalValue` property.



## Author

banxi1988, banxi1988@gmail.com

## License

EasyDefaults is available under the MIT license. See the LICENSE file for more info.
