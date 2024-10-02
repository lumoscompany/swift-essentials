//
//  Created by Adam Stragner
//

// MARK: - BoundariesError

public struct BoundariesError {
    // MARK: Lifecycle

    public init(_ index: Int, in collection: any Collection) {
        self.index = index
        self.count = collection.count
    }

    // MARK: Internal

    var index: Int
    var count: Int
}

public extension BoundariesError {
    static func check(index: Int, in collection: any Collection) throws (Self) {
        guard index <= collection.count
        else {
            throw BoundariesError(index, in: collection)
        }
    }

    static func check(count: Int, in collection: any Collection) throws (Self) {
        guard count <= collection.count
        else {
            throw BoundariesError(count - 1, in: collection)
        }
    }
}

// MARK: LocalizedError

extension BoundariesError: LocalizedError {
    public var errorDescription: String? {
        "Couldn't read element with index '\(index)'; it's out of boundaries of count '\(count)'"
    }
}
