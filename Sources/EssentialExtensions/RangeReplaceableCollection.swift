//
//  Created by Adam Stragner
//

public extension RangeReplaceableCollection where Index == Int {
    func splitted(by size: Int) -> [SubSequence] {
        stride(from: 0, to: count, by: size).map({ self[$0 ..< $0 + size] })
    }
}

public extension RangeReplaceableCollection where Element: Numeric {
    mutating func appendTrailingZeroesIfNeeded(withDevider devider: Int) {
        let reminder = count % devider
        guard reminder > 0
        else {
            return
        }
        append(contentsOf: [Element](repeating: 0, count: 4 - reminder))
    }

    func appendingTrailingZeroesIfNeeded(withDevider devider: Int) -> Self {
        var copy = self
        copy.appendTrailingZeroesIfNeeded(withDevider: devider)
        return copy
    }
}
