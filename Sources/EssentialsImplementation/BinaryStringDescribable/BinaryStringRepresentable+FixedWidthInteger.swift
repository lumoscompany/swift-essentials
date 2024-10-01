//
//  Created by Adam Stragner
//

public extension BinaryStringConvertible where Self: FixedWidthInteger {
    var binaryString: String {
        var binaryString = ""
        var internalNumber = self
        for _ in 1 ... bitWidth {
            binaryString.insert(contentsOf: "\(internalNumber & 1)", at: binaryString.startIndex)
            internalNumber >>= 1
        }
        return binaryString
    }
}

// MARK: - UInt8 + BinaryStringRepresentable

extension UInt8: BinaryStringRepresentable {}

// MARK: - UInt16 + BinaryStringRepresentable

extension UInt16: BinaryStringRepresentable {}

// MARK: - UInt32 + BinaryStringRepresentable

extension UInt32: BinaryStringRepresentable {}

// MARK: - UInt64 + BinaryStringRepresentable

extension UInt64: BinaryStringRepresentable {}

// MARK: - Int8 + BinaryStringRepresentable

extension Int8: BinaryStringRepresentable {}

// MARK: - Int16 + BinaryStringRepresentable

extension Int16: BinaryStringRepresentable {}

// MARK: - Int32 + BinaryStringRepresentable

extension Int32: BinaryStringRepresentable {}

// MARK: - Int64 + BinaryStringRepresentable

extension Int64: BinaryStringRepresentable {}
