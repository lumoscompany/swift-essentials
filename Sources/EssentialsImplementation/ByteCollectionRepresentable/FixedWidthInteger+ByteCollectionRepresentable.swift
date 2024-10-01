//
//  Created by Adam Stragner
//

public extension ByteCollectionConvertible where Self: FixedWidthInteger {
    func byteCollection(with endianness: Endianness = .big) -> ByteCollection {
        var value = switch endianness {
        case .little: littleEndian
        case .big: bigEndian
        }
        return withUnsafeBytes(of: &value, Array.init)
    }
}

public extension ExpressibleByByteCollection where Self: FixedWidthInteger {
    init(byteCollection: ByteCollection, _ endianness: Endianness = .big) {
        var bytes = byteCollection
        let lackingBytesCount = MemoryLayout<Self>.size - bytes.count

        precondition(
            lackingBytesCount >= 0,
            "Couldn't initialize \(String(describing: Self.self)):\(MemoryLayout<Self>.size) with bytes count \(bytes.count)"
        )

        if lackingBytesCount > 0 {
            let lackingBytes = [UInt8](repeating: 0x00, count: lackingBytesCount)
            switch endianness {
            case .little: bytes = bytes + lackingBytes
            case .big: bytes = lackingBytes + bytes
            }
        }

        let value = bytes.withUnsafeBytes({ $0.load(as: Self.self) })
        self = switch endianness {
        case .little: value // Swift uses .littleEndian by default
        case .big: value.byteSwapped
        }
    }
}

// MARK: - UInt8 + ByteCollectionRepresentable

extension UInt8: ByteCollectionRepresentable {}

// MARK: - UInt16 + ByteCollectionRepresentable

extension UInt16: ByteCollectionRepresentable {}

// MARK: - UInt32 + ByteCollectionRepresentable

extension UInt32: ByteCollectionRepresentable {}

// MARK: - UInt64 + ByteCollectionRepresentable

extension UInt64: ByteCollectionRepresentable {}

// MARK: - Int8 + ByteCollectionRepresentable

extension Int8: ByteCollectionRepresentable {}

// MARK: - Int16 + ByteCollectionRepresentable

extension Int16: ByteCollectionRepresentable {}

// MARK: - Int32 + ByteCollectionRepresentable

extension Int32: ByteCollectionRepresentable {}

// MARK: - Int64 + ByteCollectionRepresentable

extension Int64: ByteCollectionRepresentable {}
