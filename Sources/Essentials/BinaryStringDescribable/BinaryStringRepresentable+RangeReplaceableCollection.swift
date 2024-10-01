//
//  Created by Adam Stragner
//

public extension RangeReplaceableCollection where Element == BinaryStringConvertible {
    var binaryString: String {
        map({ $0.binaryString }).joined(separator: " ")
    }
}
