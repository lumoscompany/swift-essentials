//
//  Created by Adam Stragner
//

import EssentialsImplementation

// MARK: - ReadableByteCollection

public struct ReadableByteCollection: RawRepresentable {
    // MARK: Lifecycle

    public init() {
        self.init(rawValue: ByteCollection())
    }

    public init(_ bytes: any ContiguousBytes) {
        self.init(rawValue: bytes.concreteBytes)
    }

    public init(rawValue: ByteCollection) {
        self.storage = rawValue
    }

    // MARK: Public

    public var rawValue: ByteCollection { storage }

    public var isEmpty: Bool { storage.isEmpty }
    public var count: Int { storage.count }

    @discardableResult
    public func get() throws (BoundariesError) -> UInt8 {
        try get(1)[0]
    }

    @discardableResult
    public func get(_ count: Int) throws (BoundariesError) -> ByteCollection {
        try BoundariesError.check(count: count, in: storage)

        let elements = storage[0 ..< count]
        return Array(elements)
    }

    @discardableResult
    public mutating func read() throws (BoundariesError) -> UInt8 {
        try read(1)[0]
    }

    @discardableResult
    public mutating func read(_ count: Int) throws (BoundariesError) -> ByteCollection {
        try BoundariesError.check(count: count, in: storage)

        let elements = storage[0 ..< count]
        storage = Array(storage.dropFirst(count))
        return Array(elements)
    }

    public mutating func append(_ byte: Byte) {
        storage.append(byte)
    }

    public mutating func append(contentsOf collection: ReadableByteCollection) {
        storage.append(contentsOf: collection.rawValue)
    }

    public mutating func append(contentsOf bytes: any ContiguousBytes) {
        storage.append(contentsOf: bytes.concreteBytes)
    }

    // MARK: Private

    private var storage: ByteCollection
}

// MARK: ExpressibleByArrayLiteral

extension ReadableByteCollection: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Byte...) {
        self.init(elements)
    }
}

// MARK: ExpressibleByStringLiteral

extension ReadableByteCollection: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        guard let rawValue = ByteCollection(hexadecimalString: value)
        else {
            fatalError("Invalid string literal: \(value)")
        }
        self.init(rawValue: rawValue)
    }
}

// MARK: HexadecimalStringRepresentable

extension ReadableByteCollection: HexadecimalStringRepresentable {
    public var hexadecimalString: String { rawValue.hexadecimalString }

    public init?(hexadecimalString: String) {
        guard let rawValue = ByteCollection(hexadecimalString: hexadecimalString)
        else {
            return nil
        }
        self.init(rawValue: rawValue)
    }
}

// MARK: LosslessStringConvertible

extension ReadableByteCollection: LosslessStringConvertible {
    public var description: String { hexadecimalString }

    public init?(_ description: String) {
        self.init(hexadecimalString: description)
    }
}

// MARK: Equatable

extension ReadableByteCollection: Equatable {
    public static func == (lhs: ReadableByteCollection, rhs: ReadableByteCollection) -> Bool {
        lhs.storage == rhs.storage
    }
}

// MARK: Hashable

extension ReadableByteCollection: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(storage)
    }
}

// MARK: Sendable

extension ReadableByteCollection: Sendable {}
