import UIKit

protocol InitializableFromInt {
    init(_ value: Int)
}

extension Int {
    /// Automatically converts an `Int` to the right type.
    func autoConvert<T: InitializableFromInt>() -> T {
        return T(self)
    }
}

// MARK: - FloatingPointType
extension Double: InitializableFromInt { }

extension Float: InitializableFromInt { }

extension CGFloat: InitializableFromInt { }

// MARK: - SignedIntegerType
extension Int8: InitializableFromInt { }

extension Int32: InitializableFromInt { }

extension Int64: InitializableFromInt { }

// MARK: - BooleanType
extension Bool: InitializableFromInt {
    init(_ value: Int) {
        self = value != 0
    }
}
