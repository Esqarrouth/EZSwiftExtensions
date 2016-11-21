# Change Log
All notable changes to this project will be documented in this file.

## [Unreleased] 

### Fixed bugs

1. **Array:**
  - `shuffle()` crashing if array contains one or zero elements by *piv199*

2. **EZSwiftExtensions:**
  - Setting image on undefined thread for `imageWithURL` related methods by *piv199*
  - `runThisEvery()` now returns `Timer` instead of `CFLoopTimer` by *lfarah*

### Added extensions

1. **Array:**
  - `shuffled() -> Array` by *piv199* [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/212)
  - `unique()` by *Khalian*
  - `get(at range:ClosedRange<Int>)` by *Dendim0n*

2. **Date:**
  - `isToday` by *Khalian*
  - `year` by *Khalian*
  - `month` by *Khalian*
  - `weekday` by *Khalian*
  - `monthAsString` by *Khalian*
  - `day` by *Khalian*
  - `hour` by *Khalian*
  - `minute` by *Khalian*
  - `second` by *Khalian*

3. **CGFloat:**
  - `radiansToDegrees()` by *Khalian*
  - `toDegreesInPlace()` by *Khalian*
  - `radiansToDegrees(_ angleInDegrees : CGFloat)` by *Khalian*
  - `random()` by *Khalian*
  - `random(within: Range<CGFloat>)` by *Khalian*
  - `random(within: ClosedRange<CGFloat>)` by *Khalian*
  - `shortestAngleInRadians(from first: CGFloat, to second: CGFloat)` by *Khalian*

4. **CGPoint:**
  - `operator +` by *Khalian*
  - `operator -` by *Khalian*
  - `operator *` by *Khalian*
  - `distance(from: CGPoint, to: CGPoint)` by *Khalian*
  - `normalized()` by *Khalian*
  - `angle` by *Khalian*
  - `dotProduct(this: CGPoint, that: CGPoint)` by *Khalian*
  - `linearInterpolation(startPoint: CGPoint, endPoint: CGPoint, interpolationParam: CGFloat)` by *Khalian*

5. **FloatingPoint:**
  - `round(toPlaces places: Int)` by *piv199*
  - `rounded(toPlaces places: Int)` by *piv199*
  - `ceil(toPlaces places: Int)` by *piv199*
  - `ceiled(toPlaces places: Int)` by *piv199*

6. **String:**
  - `urlEncoded()` by *Khalian*
  - `urlEncode()` by *Khalian*
  - `subscript(integerClosedRange: ClosedRange<Int>)` by *lfarah*

7. **UIView**
  - `fadeIn(_ duration: TimeInterval?, delay: TimeInterval?, completion: ((Bool) -> Void)?)` by *vilapuigvila*
  - `fadeOut(_ duration: TimeInterval?, delay: TimeInterval?, completion: ((Bool) -> Void)?)` by *vilapuigvila*
  - `fadeTo(_ value: CGFloat, duration: TimeInterval?, delay: TimeInterval?, completion: ((Bool) -> Void)?)` by *vilapuigvila*

8. **UIViewController:**
  - `hideKeyboardWhenTappedAroundAndCancelsTouchesInView()` by *furuyan*

### Modified extensions

1. **Global:**
  - Updated `M_PI` to `.pi` by *piv199*

2. **Array:**
  - `reverseIndex(_ index: Int)` now returns `Int?` instead of `Int` by *piv199*

### Deprecated/Renamed extensions

**Array:**

Method/property name  | Renamed to | Author 
------------- | ------------- | ------------- 
`containsInstanceOf<T>(_ element: T)`  | `containsType<T>(of element: T)` | piv199 
`get(_ index: Int)`  | `get(at index: Int)` | piv199 
`removeObjects(_ objects: Element...)`  | `removeAll(_ elements: Element...)` | piv199 
`removeFirstObject(_ object: Element)`  | `removeFirst(_ element: Element)` | piv199 
`testIfAllIs(_ condition: Bool)`  | `testAll(is condition: Bool)` | piv199 

**CGFloat:**

Method/property name  | Renamed to | Author 
------------- | ------------- | ------------- 
 `toRadians()` | `degreesToRadians()` | Khalian 

**Double:**

Method/property name  | Renamed to | Author 
------------- | ------------- | ------------- 
 `ceilByPlaces(_ places: Int)` | `ceil(toPlaces places: Int)` | piv199 
 `getCeiledByPlaces(_ places: Int)` | `ceiled(toPlaces places: Int)` | piv199 
 `getRoundedByPlaces(_ places: Int)` | `rounded(toPlaces places: Int)` | piv199 
 `roundByPlaces(_ places: Int)` | `round(toPlaces places: Int)` | piv199 

**UIColor:**

Method/property name  | Renamed to | Author 
------------- | ------------- | ------------- 
 `randomColor(_ randomAlpha: Bool)` | `random(randomAlpha: Bool)` | lfarah 

**UIFont:**

Method/property name  | Renamed to | Author 
------------- | ------------- | ------------- 
`PrintFontFamily(_ font: FontName)` | *deprecated* | lfarah

**UIViewController:**

Method/property name  | Renamed to | Author 
------------- | ------------- | ------------- 
 `hideKeyboardWhenTappedAround(handler: ((UITapGestureRecognizer) -> Void)?)` | `hideKeyboardWhenTappedAround()` | furuyan 

### Deprecated/Renamed classes

1. **UIColoredView**

[All changes](https://github.com/goktugyil/EZSwiftExtensions/compare/1.7...master)

