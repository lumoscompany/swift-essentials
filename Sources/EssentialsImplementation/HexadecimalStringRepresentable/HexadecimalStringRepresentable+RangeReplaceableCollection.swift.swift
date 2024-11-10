//
//  Created by Adam Stragner
//

public extension RangeReplaceableCollection where Element: HexadecimalStringConvertible {
    var hexadecimalString: String {
        hexadecimalString(separator: "")
    }

    func hexadecimalString(separator: String = " ") -> String {
        map(\.hexadecimalString).joined(separator: separator)
    }
}

public extension RangeReplaceableCollection where Element: ExpressibleByHexadecimalString {
    init?(hexadecimalString: String) {
        let elementBytesCount = MemoryLayout<Element>.size
        guard hexadecimalString.count.isMultiple(of: elementBytesCount)
        else {
            return nil
        }

        let elements = stride(
            from: 0,
            to: hexadecimalString.count,
            by: elementBytesCount
        ).compactMap({
            Element(hexadecimalString: String(hexadecimalString[$0 ..< $0 + elementBytesCount]))
        })

        guard elements.count == hexadecimalString.count / elementBytesCount
        else {
            return nil
        }

        self.init(elements)
    }
}
