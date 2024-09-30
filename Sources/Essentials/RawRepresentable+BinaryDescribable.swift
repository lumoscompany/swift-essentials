//
//  Created by Adam Stragner
//

import EssentialProtocols

public extension RawRepresentable where RawValue == BinaryDescribable {
    var binaryDescription: String { rawValue.binaryDescription }
}

public extension RawRepresentable
    where
    RawValue: RangeReplaceableCollection,
    RawValue.Element == BinaryDescribable
{
    var binaryDescription: String { rawValue.binaryDescription }
}
