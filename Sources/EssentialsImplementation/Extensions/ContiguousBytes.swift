//
//  Created by Adam Stragner
//

public extension ContiguousBytes {
    var concreteBytes: [Byte] {
        var bytes = [Byte]()
        let _ = withUnsafeBytes({ buffer in
            bytes.append(contentsOf: buffer)
        })
        return bytes
    }
}
