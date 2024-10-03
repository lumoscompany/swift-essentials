//
//  Created by Adam Stragner
//

public extension RangeReplaceableCollection where Element == BinaryStringConvertible {
    var binaryString: String {
        binaryString(separator: "")
    }

    func binaryString(separator: String = " ") -> String {
        map(\.binaryString).joined(separator: separator)
    }
}
