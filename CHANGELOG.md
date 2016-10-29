# Change Log
All notable changes to this project will be documented in this file.

## [Unreleased] 

### Added extensions

**Array:**
- ```swift shuffled()``` by @piv199
- `unique()` by @Khalian
- `get(at range:ClosedRange<Int>)` by @Dendim0n

**CGFloat:**
- `radiansToDegrees()` by @Khalian
- `toDegreesInPlace()` by @Khalian
- `radiansToDegrees(_ angleInDegrees : CGFloat)` by @Khalian
- `random()` by @Khalian
- `random(within: Range<CGFloat>)` by @Khalian
- `random(within: ClosedRange<CGFloat>)` by @Khalian

**FloatingPoint:**
- `round(toPlaces places: Int)` by @piv199
- `rounded(toPlaces places: Int)` by @piv199
- `ceil(toPlaces places: Int)` by @piv199
- `ceiled(toPlaces places: Int)` by @piv199

**String:**
- `urlEncoded()` by @Khalian
- `urlEncode()` by @Khalian

### Modified extensions

**Global:**
- Updated `M_PI` to `.pi` #216 by @piv199

**Array:**
- `reverseIndex(_ index: Int)` now returns `Int?` instead of `Int` by @piv199

### Fixed bugs

**Array:**
- `shuffle()` crashing if array contains one or zero elements  by @piv199

**EZSwiftExtensions:**
- Setting image on undefined thread for `imageWithURL` related methods #217 by @piv199
- `runThisEvery()` now returns `Timer` instead of `CFLoopTimer` #228 by @lfarah

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
| `toRadians()` | `degreesToRadians()` | Khalian |

**Double:**

Method/property name  | Renamed to | Author 
------------- | ------------- | ------------- 
 `ceilByPlaces(_ places: Int)` | `ceil(toPlaces: places: Int)` | piv199 
 `getCeiledByPlaces(_ places: Int)` | `ceiled(toPlaces: places: Int)` | piv199 
 `getRoundedByPlaces(_ places: Int)` | `rounded(toPlaces places: Int)` | piv199 
 `roundByPlaces(_ places: Int)` | `round(toPlaces places: Int)` | piv199 

**UIColor:**

Method/property name  | Renamed to | Author 
------------- | ------------- | ------------- 
 `randomColor(_ randomAlpha: Bool)` | `random(randomAlpha: Bool)` | lfarah 
