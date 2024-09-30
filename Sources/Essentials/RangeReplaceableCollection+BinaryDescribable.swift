//
//  Created by Adam Stragner
//

import EssentialProtocols

public extension RangeReplaceableCollection where Element == BinaryDescribable {
    var binaryDescription: String {
        map({ $0.binaryDescription }).joined(separator: " ")
    }
}
