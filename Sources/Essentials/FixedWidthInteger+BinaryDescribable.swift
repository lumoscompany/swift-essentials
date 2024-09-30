//
//  Created by Adam Stragner
//

import EssentialsProtocols

public extension BinaryDescribable where Self: FixedWidthInteger {
    var binaryDescription: String {
        var binaryString = ""
        var internalNumber = self
        for _ in 1 ... bitWidth {
            binaryString.insert(contentsOf: "\(internalNumber & 1)", at: binaryString.startIndex)
            internalNumber >>= 1
        }
        return binaryString
    }
}

// MARK: - UInt8 + BinaryDescribable

extension UInt8: BinaryDescribable {}

// MARK: - UInt16 + BinaryDescribable

extension UInt16: BinaryDescribable {}

// MARK: - UInt32 + BinaryDescribable

extension UInt32: BinaryDescribable {}

// MARK: - UInt64 + BinaryDescribable

extension UInt64: BinaryDescribable {}

// MARK: - Int8 + BinaryDescribable

extension Int8: BinaryDescribable {}

// MARK: - Int16 + BinaryDescribable

extension Int16: BinaryDescribable {}

// MARK: - Int32 + BinaryDescribable

extension Int32: BinaryDescribable {}

// MARK: - Int64 + BinaryDescribable

extension Int64: BinaryDescribable {}
