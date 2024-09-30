//
//  Created by Adam Stragner
//

#if IS_APPLE

import Foundation

public extension ContiguousBytes {
    var concreteBytes: [UInt8] {
        var bytes = [UInt8]()
        let _ = withUnsafeBytes({ buffer in
            bytes.append(contentsOf: buffer)
        })
        return bytes
    }
}

#endif
