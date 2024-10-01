//
//  Created by Adam Stragner
//

// MARK: - OptionByte

public protocol OptionByte {
    associatedtype OptionKeys: OptionKey

    var rawValue: Byte { get set }
}

// MARK: - OptionKey

public protocol OptionKey: RawRepresentable where RawValue == Byte {}

public extension OptionByte {
    subscript(option key: OptionKeys) -> Bool {
        get { (rawValue & (1 << key.rawValue)) != 0 }
        mutating set {
            let mask = UInt8(1 << key.rawValue)
            rawValue = (rawValue & ~mask) | (newValue ? mask : 0)
        }
    }
}
