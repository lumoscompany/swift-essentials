//
//  Created by Adam Stragner
//

public extension String {
    subscript(index: Int) -> SubSequence {
        return self[index ..< index + 1]
    }

    func substring(fromIndex: Int) -> SubSequence {
        return self[min(fromIndex, count) ..< count]
    }

    func substring(toIndex: Int) -> SubSequence {
        return self[0 ..< max(0, toIndex)]
    }

    subscript(range: Range<Int>) -> SubSequence {
        let range = Range(uncheckedBounds: (
            lower: max(0, min(count, range.lowerBound)),
            upper: min(count, max(0, range.upperBound))
        ))

        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)

        return self[start ..< end]
    }
}
