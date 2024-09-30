//
//  Created by Adam Stragner
//

import EssentialProtocols

public extension BytesConvertible where Self: FixedWidthInteger {
    func bytes(with representation: EndiannessRepresentation) -> [UInt8] {
        var value = switch representation {
        case .little: littleEndian
        case .big: bigEndian
        }
        return withUnsafeBytes(of: &value, Array.init)
    }
}

public extension ExpressibleByBytes where Self: FixedWidthInteger {
    init(bytes: [UInt8], _ representation: EndiannessRepresentation) {
        var bytes = bytes

        let lackingBytesCount = MemoryLayout<Self>.size - bytes.count
        precondition(
            lackingBytesCount >= 0,
            "Couldn't initialize \(String(describing: Self.self)):\(MemoryLayout<Self>.size) with bytes count \(bytes.count)"
        )

        if lackingBytesCount > 0 {
            let lackingBytes = [UInt8](repeating: 0x00, count: lackingBytesCount)
            switch representation {
            case .little: bytes = bytes + lackingBytes
            case .big: bytes = lackingBytes + bytes
            }
        }

        let value = bytes.withUnsafeBytes({ $0.load(as: Self.self) })
        self = switch representation {
        case .little: value // Swift uses .littleEndian on Apple platfroms by default
        case .big: value.byteSwapped
        }
    }
}

// MARK: - UInt8 + BytesRepresentable

extension UInt8: BytesRepresentable {}

// MARK: - UInt16 + BytesRepresentable

extension UInt16: BytesRepresentable {}

// MARK: - UInt32 + BytesRepresentable

extension UInt32: BytesRepresentable {}

// MARK: - UInt64 + BytesRepresentable

extension UInt64: BytesRepresentable {}

// MARK: - Int8 + BytesRepresentable

extension Int8: BytesRepresentable {}

// MARK: - Int16 + BytesRepresentable

extension Int16: BytesRepresentable {}

// MARK: - Int32 + BytesRepresentable

extension Int32: BytesRepresentable {}

// MARK: - Int64 + BytesRepresentable

extension Int64: BytesRepresentable {}
