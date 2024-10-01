//
//  Created by Adam Stragner
//

// MARK: - HexadecimalStringConvertible

public protocol HexadecimalStringConvertible {
    var hexadecimalString: String { get }
}

// MARK: - UInt8 + HexadecimalStringConvertible

extension UInt8: HexadecimalStringConvertible {
    public var hexadecimalString: String { String(self, radix: 16, uppercase: false) }
}

// MARK: - ExpressibleByHexadecimalString

public protocol ExpressibleByHexadecimalString {
    init?(hexadecimalString: String)
}

// MARK: - UInt8 + ExpressibleByHexadecimalString

extension UInt8: ExpressibleByHexadecimalString {
    public init?(hexadecimalString: String) {
        guard hexadecimalString.count == 2
        else {
            return nil
        }

        self.init(hexadecimalString, radix: 16)
    }
}

typealias HexadecimalStringRepresentable =
    HexadecimalStringConvertible &
    ExpressibleByHexadecimalString
