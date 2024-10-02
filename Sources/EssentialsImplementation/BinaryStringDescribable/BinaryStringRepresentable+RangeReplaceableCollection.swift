//
//  Created by Adam Stragner
//

public extension RangeReplaceableCollection where Element == BinaryStringConvertible {
    var binaryString: String {
        map(\.binaryString).joined(separator: " ")
    }
}
