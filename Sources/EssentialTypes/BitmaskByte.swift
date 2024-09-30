//
//  Created by Adam Stragner
//

// MARK: - BitmaskByte

public protocol BitmaskByte {
    associatedtype BitmaskKeys: BitmaskByteMaskKey

    var rawValue: UInt8 { get set }
}

// MARK: - BitmaskByteMaskKey

public protocol BitmaskByteMaskKey: RawRepresentable where RawValue == UInt8 {}

public extension BitmaskByte {
    subscript(mask key: BitmaskKeys) -> UInt8 {
        get { rawValue & key.rawValue }
        mutating set {
            rawValue = (rawValue & ~key.rawValue) | newValue
        }
    }
}
