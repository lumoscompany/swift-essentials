//
//  Created by Adam Stragner
//

import EssentialsProtocols

public extension RangeReplaceableCollection where Element == BinaryDescribable {
    var binaryDescription: String {
        map({ $0.binaryDescription }).joined(separator: " ")
    }
}
