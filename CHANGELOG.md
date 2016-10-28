# Change Log
All notable changes to this project will be documented in this file.

## [Unreleased] 

### Added extensions

#### Array
- `shuffled()` by @piv199
- `unique()` by @Khalian
- `get(at range:ClosedRange<Int>)` by @Dendim0n

#### FloatingPoint
- `round(toPlaces places: Int)` by @piv199
- `rounded(toPlaces places: Int)` by @piv199
- `ceil(toPlaces places: Int)` by @piv199
- `ceiled(toPlaces places: Int)` by @piv199

#### String
- `urlEncoded()` by @Khalian
- `urlEncode()` by @Khalian

#### CGFloat
- `radiansToDegrees()` by @Khalian
- `toDegreesInPlace()` by @Khalian
- `radiansToDegrees(_ angleInDegrees : CGFloat)` by @Khalian
- `random()` by @Khalian
- `random(within: Range<CGFloat>)` by @Khalian
- `random(within: ClosedRange<CGFloat>)` by @Khalian

### Modified extensions

#### Global
- Updated `M_PI` to `.pi` #216 by @piv199

#### Array
- `reverseIndex(_ index: Int)` now returns `Int?` instead of `Int` by @piv199

### Fixed bugs

#### Array
- `shuffle()` crashing if array contains one or zero elements  by @piv199

#### EZSwiftExtensions
- Setting image on undefined thread for `imageWithURL` related methods #217 by @piv199
- `runThisEvery()` now returns `Timer` instead of `CFLoopTimer` #228 by @lfarah

### Deprecated/Renamed extensions

#### Array:
- `removeObjects(_ objects: Element...)` renamed to `removeAll(_ elements: Element...)` by @piv199
- `removeFirstObject(_ object: Element)` renamed to `removeFirst(_ element: Element)` by @piv199
- `testIfAllIs(_ condition: Bool)` renamed to `testAll(is condition: Bool)` by @piv199
- `get(_ index: Int)` renamed to `get(at index: Int)` by @piv199
- `containsInstanceOf<T>(_ element: T)` renamed to `containsType<T>(of element: T)` by @piv199

#### Double:
- `getRoundedByPlaces(_ places: Int)` renamed to `rounded(toPlaces places: Int)` by @piv199
- `roundByPlaces(_ places: Int)` renamed to `round(toPlaces places: Int)` by @piv199
- `getCeiledByPlaces(_ places: Int)` renamed to `ceiled(toPlaces: places)` by @piv199
- `ceilByPlaces(_ places: Int)` renamed to `ceil(toPlaces: places)` by @piv199

#### CGFloat:
- `toRadians()` renamed to `degreesToRadians()` by @Khalian

#### UIColor:
- `randomColor(_ randomAlpha: Bool)` renamed to `random(randomAlpha: Bool)` by @lfarah

### Others

#### Danger
- Added PR body length rule by @lfarah
- Added PR forbids merge commits messages rule by @piv199
- Added PR changes to one extension file only rule by @piv199
- Added PR changes to one test file only rule by @piv199
- Added danger-xcode_summary by @diogot

#### Codecov
- Exclude the paths of example and tests from code coverage calculation by @bcylin
