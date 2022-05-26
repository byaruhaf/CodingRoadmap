import Foundation

//
// Created by Franklin Byaruhanga on 22/05/2022.
//

import Foundation

public class LLNode<T> {
    public var value: T
    public var next: LLNode?

    public init(value:T, next: LLNode? = nil) {
        self.value = value
        self.next = next
    }
}

extension LLNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}
