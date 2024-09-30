//
//  Created by Adam Stragner
//

// MARK: - OptionsByte

public protocol OptionsByte {
    associatedtype OptionKeys: OptionsByteBitKey

    var rawValue: UInt8 { get set }
}

// MARK: - OptionsByteBitKey

public protocol OptionsByteBitKey: RawRepresentable where RawValue == UInt8 {}

public extension OptionsByte {
    subscript(option key: OptionKeys) -> Bool {
        get { (rawValue & (1 << key.rawValue)) != 0 }
        mutating set {
            let mask = UInt8(1 << key.rawValue)
            rawValue = (rawValue & ~mask) | (newValue ? mask : 0)
        }
    }
}
