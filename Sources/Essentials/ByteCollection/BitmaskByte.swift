//
//  Created by Adam Stragner
//

// MARK: - BitmaskByte

public protocol BitmaskByte {
    associatedtype BitmaskKeys: BitmaskKey

    var rawValue: Byte { get set }
}

// MARK: - BitmaskKey

public protocol BitmaskKey: RawRepresentable where RawValue == Byte {}

public extension BitmaskByte {
    subscript(mask key: BitmaskKeys) -> Byte {
        get { rawValue & key.rawValue }
        mutating set {
            rawValue = (rawValue & ~key.rawValue) | newValue
        }
    }
}
