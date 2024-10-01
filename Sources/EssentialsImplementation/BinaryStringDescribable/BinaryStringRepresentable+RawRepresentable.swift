//
//  Created by Adam Stragner
//

public extension RawRepresentable where RawValue == BinaryStringConvertible {
    var binaryString: String { rawValue.binaryString }
}

public extension RawRepresentable
    where
    RawValue: RangeReplaceableCollection,
    RawValue.Element == BinaryStringConvertible
{
    var binaryString: String { rawValue.binaryString }
}
