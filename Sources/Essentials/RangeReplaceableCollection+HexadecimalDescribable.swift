//
//  Created by Adam Stragner
//

import EssentialsProtocols

public extension RangeReplaceableCollection where Element: HexadecimalDescribable {
    var hexadecimalDescription: String {
        map({ $0.hexadecimalDescription }).joined(separator: " ")
    }
}
