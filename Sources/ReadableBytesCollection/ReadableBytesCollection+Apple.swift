//
//  Created by Adam Stragner
//

#if !os(Linux)

import Foundation

// MARK: - Buffer.BoundariesError + LocalizedError

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

private extension ContiguousBytes {
    var concreteBytes: [UInt8] {
        var bytes = [UInt8]()
        let _ = withUnsafeBytes({ buffer in
            bytes.append(contentsOf: buffer)
        })
        return bytes
    }
}

#endif
