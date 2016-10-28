# Change Log
All notable changes to this project will be documented in this file.

## [Unreleased] 

### Added extensions

- Array
- `shuffled()` @piv199
- `unique()` @Khalian
- `get(at range:ClosedRange<Int>)` @Dendim0n

- FloatingPoint
- `round(toPlaces places: Int)` @piv199
- `rounded(toPlaces places: Int)` @piv199
- `ceil(toPlaces places: Int)` @piv199
- `ceiled(toPlaces places: Int)` @piv199

- String
- `urlEncoded()` @Khalian
- `urlEncode()` @Khalian

- CGFloat
- `radiansToDegrees()` @Khalian
- `toDegreesInPlace()` @Khalian
- `radiansToDegrees(_ angleInDegrees : CGFloat)` @Khalian
- `random()` @Khalian
- `random(within: Range<CGFloat>)` @Khalian
- `random(within: ClosedRange<CGFloat>)` @Khalian


### Modified extensions

- Updated `M_PI` to `.pi` #216 @piv199

- Array
- `reverseIndex(_ index: Int)` now returns `Int?` instead of `Int` @piv199

### Fixed bugs

- Array
- `shuffle()` crashing if array contains one or zero elements  @piv199

- EZSwiftExtensions
- Setting image on undefined thread for `imageWithURL` related methods #217 @piv199
- `runThisEvery()` now returns `Timer` instead of `CFLoopTimer` #228 @lfarah

### Deprecated/Renamed extensions

- Array
- `removeObjects(_ objects: Element...)` renamed to `removeAll(_ elements: Element...)` @piv199
- `removeFirstObject(_ object: Element)` renamed to `removeFirst(_ element: Element)` @piv199
- `testIfAllIs(_ condition: Bool)` renamed to `testAll(is condition: Bool)` @piv199
- `get(_ index: Int)` renamed to `get(at index: Int)` @piv199
- `containsInstanceOf<T>(_ element: T)` renamed to `containsType<T>(of element: T)` @piv199

- Double
- `getRoundedByPlaces(_ places: Int)` renamed to `rounded(toPlaces places: Int)` @piv199
- `roundByPlaces(_ places: Int)` renamed to `round(toPlaces places: Int)` @piv199
- `getCeiledByPlaces(_ places: Int)` renamed to `ceiled(toPlaces: places)` @piv199
- `ceilByPlaces(_ places: Int)` renamed to `ceil(toPlaces: places)` @piv199

- CGFloat
- `toRadians()` renamed to `degreesToRadians()` @Khalian

- UIColor
- `randomColor(_ randomAlpha: Bool)` renamed to `random(randomAlpha: Bool)` @lfarah

### Others

- Added codecov @lfarah
- Added Danger @lfarah

### Danger

- Added PR body length rule @lfarah
- Added PR forbids merge commits messages rule @piv199
- Added PR changes to one extension file only rule @piv199
- Added PR changes to one test file only rule @piv199
- Added danger-xcode_summary @diogot

###Codecov

- Exclude the paths of example and tests from code coverage calculation @bcylin
