//
//  Created by Adam Stragner
//

import EssentialsProtocols

public extension HexadecimalDescribable where Self: FixedWidthInteger {
    var hexadecimalDescription: String {
        String(self, radix: 16, uppercase: true)
    }
}

// MARK: - UInt8 + HexadecimalDescribable

extension UInt8: HexadecimalDescribable {}

// MARK: - UInt16 + HexadecimalDescribable

extension UInt16: HexadecimalDescribable {}

// MARK: - UInt32 + HexadecimalDescribable

extension UInt32: HexadecimalDescribable {}

// MARK: - UInt64 + HexadecimalDescribable

extension UInt64: HexadecimalDescribable {}

// MARK: - Int8 + HexadecimalDescribable

extension Int8: HexadecimalDescribable {}

// MARK: - Int16 + HexadecimalDescribable

extension Int16: HexadecimalDescribable {}

// MARK: - Int32 + HexadecimalDescribable

extension Int32: HexadecimalDescribable {}

// MARK: - Int64 + HexadecimalDescribable

extension Int64: HexadecimalDescribable {}
