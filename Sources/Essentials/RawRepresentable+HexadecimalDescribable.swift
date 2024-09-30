//
//  Created by Adam Stragner
//

import EssentialsProtocols

public extension RawRepresentable where RawValue: HexadecimalDescribable {
    var hexadecimalDescription: String { rawValue.hexadecimalDescription }
}

public extension RawRepresentable
    where
    RawValue: RangeReplaceableCollection,
    RawValue.Element: HexadecimalDescribable
{
    var hexadecimalDescription: String { rawValue.hexadecimalDescription }
}
