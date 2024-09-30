//
//  Created by Adam Stragner
//

// MARK: - BytesConvertible

public protocol BytesConvertible {
    func bytes(with representation: EndiannessRepresentation) -> [UInt8]
}

// MARK: - ExpressibleByBytes

public protocol ExpressibleByBytes {
    init(bytes: [UInt8], _ representation: EndiannessRepresentation)
}

public typealias BytesRepresentable = BytesConvertible & ExpressibleByBytes

// MARK: - EndiannessRepresentation

public enum EndiannessRepresentation {
    case little
    case big
}
