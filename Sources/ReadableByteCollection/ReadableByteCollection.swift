//
//  Created by Adam Stragner
//

import Essentials

// MARK: - ReadableByteCollection

public final class ReadableByteCollection: RawRepresentable {
    // MARK: Lifecycle

    public convenience init(_ value: ByteCollection = ByteCollection()) {
        self.init(rawValue: value)
    }

    public init(rawValue: ByteCollection) {
        self.storage = rawValue
    }

    // MARK: Public

    public var rawValue: ByteCollection { storage }

    public var isEmpty: Bool { storage.isEmpty }
    public var count: Int { storage.count }

    public func append(contentsOf collection: ReadableByteCollection) {
        storage.append(contentsOf: collection.rawValue)
    }

    @discardableResult
    public func get() throws (BoundariesError) -> UInt8 {
        try get(1)[0]
    }

    @discardableResult
    public func get(_ count: Int) throws (BoundariesError) -> ByteCollection {
        try BoundariesError.check(count, in: storage)

        let elements = storage[0 ..< count]
        return Array(elements)
    }

    @discardableResult
    public func read() throws (BoundariesError) -> UInt8 {
        try read(1)[0]
    }

    @discardableResult
    public func read(_ count: Int) throws (BoundariesError) -> ByteCollection {
        try BoundariesError.check(count, in: storage)

        let elements = storage[0 ..< count]
        storage = Array(storage.dropFirst(count))
        return Array(elements)
    }

    // MARK: Internal

    var storage: ByteCollection
}

// MARK: ExpressibleByArrayLiteral

extension ReadableByteCollection: ExpressibleByArrayLiteral {
    public convenience init(arrayLiteral elements: Byte...) {
        self.init(elements)
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

#if IS_APPLE

import Foundation.NSData

public extension ReadableByteCollection {
    convenience init(_ bytes: any ContiguousBytes = ByteCollection()) {
        self.init(bytes.concreteBytes)
    }

    func append(contentsOf bytes: any ContiguousBytes) {
        storage.append(contentsOf: bytes.concreteBytes)
    }
}

#endif
