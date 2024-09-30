//
//  Created by Adam Stragner
//

import EssentialsProtocols

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
