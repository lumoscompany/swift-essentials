//
//  Created by Adam Stragner
//

import EssentialsExtensions

// MARK: - ReadableBytesCollection

public final class ReadableBytesCollection {
    // MARK: Lifecycle

    public init(_ value: [UInt8]) {
        self.storage = value
    }

    // MARK: Public

    public var value: [UInt8] { storage }

    public var isEmpty: Bool { storage.isEmpty }

    public func append(contentsOf collection: ReadableBytesCollection) {
        storage.append(contentsOf: collection.value)
    }

    @discardableResult
    public func get() throws -> UInt8 {
        try get(1)[0]
    }

    @discardableResult
    public func get(_ count: Int) throws -> [UInt8] {
        try BoundariesError().throwif(storage.count < count)

        let elements = storage[0 ..< count]
        return Array(elements)
    }

    @discardableResult
    public func read() throws -> UInt8 {
        try read(1)[0]
    }

    @discardableResult
    public func read(_ count: Int) throws -> [UInt8] {
        try BoundariesError().throwif(storage.count < count)

        let elements = storage[0 ..< count]
        storage = Array(storage.dropFirst(count))
        return Array(elements)
    }

    // MARK: Internal

    var storage: [UInt8]
}

// MARK: ExpressibleByArrayLiteral

extension ReadableBytesCollection: ExpressibleByArrayLiteral {
    public convenience init(arrayLiteral elements: UInt8...) {
        self.init(elements)
    }
}

// MARK: Equatable

extension ReadableBytesCollection: Equatable {
    public static func == (lhs: ReadableBytesCollection, rhs: ReadableBytesCollection) -> Bool {
        lhs.storage == rhs.storage
    }
}

// MARK: Hashable

extension ReadableBytesCollection: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(storage)
    }
}

// MARK: ReadableBytesCollection.BoundariesError

public extension ReadableBytesCollection {
    struct BoundariesError: Error {
        public init() {}
    }
}

#if IS_APPLE

import Foundation

extension ReadableBytesCollection.BoundariesError: LocalizedError {
    public var errorDescription: String? {
        "Couldn't read given bytes count because it's out of boundaries"
    }
}

public extension ReadableBytesCollection {
    convenience init(_ bytes: any ContiguousBytes = [UInt8]()) {
        self.init(bytes.concreteBytes)
    }

    func append(contentsOf bytes: any ContiguousBytes) {
        storage.append(contentsOf: bytes.concreteBytes)
    }
}

#endif
