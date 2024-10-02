//
//  Created by Adam Stragner
//

public extension ExpressibleByHexadecimalString where Self: ByteCollectionConvertible {
    var hexadecimalString: String {
        byteCollection(with: .big).map(\.hexadecimalString).joined(separator: "")
    }
}

public extension ExpressibleByHexadecimalString where Self: ExpressibleByByteCollection {
    init?(hexadecimalString: String) {
        guard hexadecimalString.count.isMultiple(of: 2)
        else {
            return nil
        }

        let byteCollection = stride(from: 0, to: hexadecimalString.count, by: 2).compactMap({
            UInt8(hexadecimalString: String(hexadecimalString[$0 ..< $0 + 1]))
        })

        self.init(byteCollection: byteCollection, .big)
    }
}
