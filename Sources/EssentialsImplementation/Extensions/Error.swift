//
//  Created by Adam Stragner
//

public extension Error {
    func throwif(_ condition: Bool) throws (Self) {
        guard condition
        else {
            return
        }
        throw self
    }
}
