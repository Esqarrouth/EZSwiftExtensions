# Change Log
All notable changes to this project will be documented in this file.


## Major version update

1. Swift4 version update. [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/476) by *Simple4, Steven_Cheung and lfarah*

## Unreleased

1. **Array**
   - `public subscript (safe index: Index)` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/445) by *lfarah*

2. **Double**
   - `**?(lhs:Double, rhs:Double)` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/443) by *Khalian*

3. **NSAttributedString**
   - `+ (left: NSAttributedString, right: NSAttributedString) -> NSAttributedString` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/446) by *lfarah*

4. **UILabel**
   - `public convenience init(font: UIFont, color: UIColor, alignment: NSTextAlignment)` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/441) by *icefall*

5. **UserDefaults**
   - `public func date(forKey key: String) -> Date?` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/459) by *Khalian*
   
6. **Date**
    - `public func timePassed() -> TimePassed` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/486) by *110100110101*

7. **Hashable**
    - `public var hashString: String` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/485) by *rugheid*

## [Release 1.10]

### New platform added. 

1. **MacOSX 10.11**

### Added extensions 

1. **Array**
   - `removeAll(_ elements: [Element])` (new overload) for `Equatable` elements in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/416) by *dfrib*
   - `removeAll(_ elements: [Element])` (new overload) for `Hashable` elements in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/416) by *dfrib*

2. **Collections**
   - `func parallelizedMap<R>(_ each: @escaping (Self.Iterator.Element) -> R) -> [R?]` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/394) by *Khalian*

3. **Date**
   - `init?(httpDateString: String)` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/426) by *Vic-L*

4. **EZSwiftFunctions**
   - `isInTestFlight` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/419) by *Khalian*

4. **Dictionary**
   - `func random() -> Value?` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/420) by *Khalian*

5. **EZSwiftFunctions**
   - `isInTestFlight` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/419) by *Khalian*

6. **FileManager**
   - `var documentsDirectoryPath: String?` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/338) by *vilapuigvila*
   - `var cachesDirectoryPath: String?` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/338) by *vilapuigvila*

6. **UIStackView**
   - `addArrangedSubviews(_ views: UIView...)` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/396) by *kirakik*
   - `init(distribution: UIStackViewDistribution, alignment: UIStackViewAlignment, axis: UILayoutConstraintAxis, spacing: CGFloat)` in [[PR]](https://github.com/goktugyil/         EZSwiftExtensions/pull/396) by *kirakik*

8. **UIView**
   - `roundView()` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/424) by *Vic-L*
   - `roundView(withBorderColor color: UIColor, withBorderWidth width: CGFloat)` (new overload)  in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/424) by *Vic-L*
   - `nakedView()` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/424) by *Vic-L*

9. **UIViewControllerExtensions**
   - `isNavBarHidden` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/428) by *Khalian* 

10. **Double**
   - `var toCGFloat` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/425) by *Vic-L*

11. **UITextField**
   - `validateLength()` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/429) by *Vic-L*
   - `validateEmail()` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/429) by *Vic-L*
   - `validateDigits()` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/429) by *Vic-L*

### Deprecated/Renamed extensions
1. **UIViewController**
   - `public func hideKeyboardWhenTappedAround(cancelTouches: Bool = false)` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/395) by *lfarah*

## [Release 1.9]

### Fixed bugs 

1. **Array**
   - `foreach` is now removed since its already in the std library by *Khalian*
   - `removeAll` is now removed since its already in the std library by *Khalian*

2. **Date**
   - `timePassed` now returns print value correctly, earlier used to return optionals in between by *Khalian*
   - `testMonthAsString` fixing documentation via tests by *Khalian* 

### Added extensions

1. **Bool**
   - `public var toggled` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/352) by *Khalian* 

2. **CGPoint:**
   - `init(vector: CGVector)` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/349) by *Khalian*
   - `init(angle: CGFloat)` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/349) by *Khalian*

3. **CGRect**
   - `var area` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/366) by *Khalian*

3. **Date**
   - `var isFuture` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/343) by *Khalian*
   - `var isPast` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/343) by *Khalian*
   - `var era` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/374) by *Khalian*
   - `var iso8601` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/375) by *Khalian*

4. **Double**
   - `var abs` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/365) by *Khalian*

5. **Float**
   - `static func random() -> Float` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/351) by *Khalian*
   - `static func random(within: Range<Float>) -> Float` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/351) by *Khalian*

6. **Int**
   - `var digitArray` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/373) by *Khalian*
   - `static func random(within: Range<Int>) -> Int` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/360) by *Khalian*

7. **String**
   - `func urlDecoded() -> String` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/358) by *Khalian*
   - `mutating func urlDecode() -> String` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/358) by *Khalian*

8. **UInt**
   - `static gcd(_ firstNum:UInt, _ secondNum:UInt) -> UInt` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/347) by *Khalian*
   - `static lcm(_ firstNum:UInt, _ secondNum:UInt) -> UInt` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/347)by *Khalian*

9. **UIEdgeInsets**
   - `init(inset: CGFloat)` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/368) by *furuyan*

10. **UILabel**
   - `set(text _text: String?, duration: TimeInterval)` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/340) by *vilapuigvila*

11. **UIImage**
   - `var base64: String` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/363) by *lfarah*## [Version 1.8] 

### Fixed bugs

1. **Array:**
  - `shuffle()` crashing if array contains one or zero elements by *piv199*

2. **EZSwiftExtensions:**
  - Setting image on undefined thread for `imageWithURL` related methods in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/220) by *piv199*
  - `runThisEvery()` now returns `Timer` instead of `CFLoopTimer` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/228) by *lfarah*

### Added extensions

1. **Array:**
  - `shuffled() -> Array` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/212) by *piv199* 
  - `unique() -> Array` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/254) by *Khalian*
  - `get(at range:ClosedRange<Int>) -> Array` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/260) by *Dendim0n*

2. **Date:**
  - `isToday: Bool` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/260)  by *Khalian*
  - `isYesterday: Bool` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/321)  by *Khalian*
  - `isTomorrow: Bool` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/321)  by *Khalian*
  - `year: Int` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/313) by *Khalian*
  - `month: Int` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/313) by *Khalian*
  - `weekday: Int` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/313) by *Khalian*
  - `monthAsString: String` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/313) by *Khalian*
  - `day: Int` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/313) by *Khalian*
  - `hour: Int` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/314) by *Khalian*
  - `minute: Int` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/314) by *Khalian*
  - `second: Int` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/314) by *Khalian*
  - `isThisWeek: Bool` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/321) by *Khalian*
  - `isThisMonth: Bool` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/321) by *Khalian*

3. **CGFloat:**
  - `radiansToDegrees() -> CGFloat` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/258) by *Khalian*
  - `toDegreesInPlace()` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/258) by *Khalian*
  - `static radiansToDegrees(_ angleInDegrees : CGFloat) -> CGFloat` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/258) by *Khalian*
  - `static random() -> CGFloat` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/262) by *Khalian*
  - `static random(within: Range<CGFloat>)` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/262) by *Khalian*
  - `static random(within: ClosedRange<CGFloat>)` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/262) by *Khalian*
  - `static shortestAngleInRadians(from first: CGFloat, to second: CGFloat) -> CGFloat` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/272) by *Khalian*

4. **CGPoint:**
  - `operator +(this: CGPoint, that: CGPoint) -> CGPoint` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/262) by *Khalian*
  - `operator -` by *Khalian*
  - `operator *` by *Khalian*
  - `static distance(from: CGPoint, to: CGPoint) -> CGPoint` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/278) by *Khalian*
  - `normalized()` by *Khalian*
  - `angle: CGFloat` in [[PR]](https://github.com/goktugyil/EZSwiftExtensions/pull/287) by *Khalian*
  - `dotProduct(this: CGPoint, that: CGPoint) -> CGPoint` in [[PR](https://github.com/goktugyil/EZSwiftExtensions/pull/290)] by *Khalian*
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

9. **Dictionary:**
  - `static constructFromJSON(json: String) -> Dictionary` by *Khalian*
  - `formatJSON() -> String?` by *Khalian*

10. **Character:**
  - `lowercased: Character` by *Khalian*
  - `uppercased: Character` by *Khalian*

### Modified extensions

1. **Global:**
  - Updated `M_PI` to `.pi` by *piv199*

2. **Array:**
  - `reverseIndex(_ index: Int)` now returns `Int?` instead of `Int` by *piv199*

### Deprecated/Renamed classes

1. **UIColoredView**

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

**NSDictionary:**

Method/property name  | Renamed to | Author 
------------- | ------------- | ------------- 
`init?(json: String)` | *deprecated* | lfarah
`formatJSON() -> String?` | *deprecated* | lfarah 

**UIImageView:**

Method/property name  | Renamed to | Author 
------------- | ------------- | -------------
`imageWithUrl(url: String, placeholderNamed: String)` | `image(url: String, placeholderNamed: String)` | lfarah
`imageWithUrl(url: String, placeholder: UIImage)` | `image(url: String, placeholder: UIImage)` | lfarah
`imageWithUrl(url: String)` | `image(url: String)` | lfarah


[All changes](https://github.com/goktugyil/EZSwiftExtensions/compare/1.7...master)

