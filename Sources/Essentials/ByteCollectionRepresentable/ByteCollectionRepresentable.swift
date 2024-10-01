//
//  Created by Adam Stragner
//

// MARK: - ByteCollectionConvertible

public protocol ByteCollectionConvertible {
    func byteCollection(with endianness: Endianness) -> ByteCollection
}

// MARK: - ExpressibleByByteCollection

public protocol ExpressibleByByteCollection {
    init(byteCollection: ByteCollection, _ endianness: Endianness)
}

public typealias ByteCollectionRepresentable =
    ByteCollectionConvertible &
    ExpressibleByByteCollection
