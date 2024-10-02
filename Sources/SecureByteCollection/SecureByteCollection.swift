//
//  Created by Adam Stragner
//

import EssentialsImplementation

// MARK: - SecureByteCollection

public final class SecureByteCollection {
    // MARK: Lifecycle

    public init(_ contiguousBytes: any ContiguousBytes) {
        let byteCollection = contiguousBytes.concreteBytes

        self.count = byteCollection.count

        self.pointer = .allocate(
            byteCount: byteCollection.count,
            alignment: MemoryLayout<UInt8>.size
        )
        pointer.copyMemory(from: byteCollection, byteCount: byteCollection.count)
    }

    deinit {
        let zeros = [UInt8](repeating: 0, count: count)
        pointer.copyMemory(from: zeros, byteCount: count)
        pointer.deallocate()
    }

    // MARK: Public

    public func perform<T>(with body: (Data) throws -> T) rethrows -> T {
        let data = Data(bytesNoCopy: pointer, count: count, deallocator: .none)
        return try body(data)
    }

    public func perform<T>(with body: (Data) async throws -> T) async rethrows -> T {
        let data = Data(bytesNoCopy: pointer, count: count, deallocator: .none)
        return try await body(data)
    }

    // MARK: Private

    private let count: Int
    private let pointer: UnsafeMutableRawPointer
}

// MARK: Sendable

extension SecureByteCollection: @unchecked Sendable {}

// MARK: Equatable

extension SecureByteCollection: Equatable {
    public static func == (lhs: SecureByteCollection, rhs: SecureByteCollection) -> Bool {
        var result = false
        lhs.perform(with: { lhs in
            rhs.perform(with: { rhs in
                result = lhs == rhs
            })
        })
        return result
    }
}

// MARK: Hashable

extension SecureByteCollection: Hashable {
    public func hash(into hasher: inout Hasher) {
        perform(with: {
            hasher.combine($0)
        })
    }
}

// MARK: CustomStringConvertible

extension SecureByteCollection: CustomStringConvertible {
    public var description: String {
        "[SecureByteCollection]"
    }
}

// MARK: CustomDebugStringConvertible

extension SecureByteCollection: CustomDebugStringConvertible {
    public var debugDescription: String {
        "[SecureByteCollection]"
    }
}

public extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: SecureByteCollection) {
        appendInterpolation(value.description)
    }
}
