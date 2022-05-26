
public struct LinkedList<T> {
    public  typealias  Node = LLNode<T>
    public var head: Node?
    public var tail: Node?
    public init() {}
    public var isEmpty: Bool {
        head == nil
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

//Finding a node in list

extension LinkedList {
    public func node(at index: Int) -> Node? {
        var currentNode = head
        var currentIndex = 0

        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }

        return currentNode
    }
}

//Adding values to the list

extension LinkedList {
    public mutating func push(_ value: T) {
        copyNodes()
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }

    public mutating func append(_ value: T) {
        copyNodes()
        guard !isEmpty else {
            push(value)
            return
        }

        tail!.next = Node(value: value)
        tail = tail!.next
    }

    @discardableResult
    public mutating func insert(_ value: T, after node:Node) -> Node {
        copyNodes()
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }

}

//Example of push
//var list = LinkedList<Int>()
//list.push(3)
//list.push(2)
//list.push(1)

//print(list)

//Example of append
//var list = LinkedList<Int>()
//list.append(3)
//list.append(2)
//list.append(1)

//print(list)

//Example of insert
//var list = LinkedList<Int>()
//list.push(3)
//list.push(2)
//list.push(1)

//print("Before inserting: \(list)")
//var middleNode = list.node(at: 1)!

//for _ in 1...4 {
//    middleNode = list.insert(-1, after: middleNode)
//}

//print("After inserting: \(list)")


//Removing values from the list
extension LinkedList {

    public mutating func pop()  -> T?{
        copyNodes()
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }

    @discardableResult
    public mutating func removeLast() -> T? {
        copyNodes()
        // If head is nil, there’s nothing to remove, so you return nil.
        guard let head = head else {
            return nil
        }
        // If the list only consists of one node, removeLast is functionally equivalent to pop.
        guard head.next != nil else {
            return pop()
        }

        // searching for a next node until current.next is nil.
        var prev = head
        var current = head

        while let next = current.next {
            prev = current
            current = next
        }
        // Since current is the last node, disconnect it using the prev.next
        prev.next = nil
        tail = prev
        return current.value
    }

    @discardableResult
    public mutating func remove(after node:Node) -> T? {
        guard let node = copyNodes(returningCopyOf: node) else {
            return nil
        }
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }

}

//Example of pop
//var list = LinkedList<Int>()
//list.push(3)
//list.push(2)
//list.push(1)
//print("Before popping list: \(list)")

//let poppedValue = list.pop()
//print("After popping list: \(list)")
//print("Popped Value: " + String(describing: poppedValue))

//Example of removing the last node
//var list = LinkedList<Int>()
//list.push(3)
//list.push(2)
//list.push(1)
//print("Before popping list: \(list)")

//let removedValue = list.removeLast()
//print("After removing last node: \(list)")
//print("removed Value: " + String(describing: removedValue))

//Example of removing the last node
//var list = LinkedList<Int>()
//list.push(3)
//list.push(2)
//list.push(1)
//print("Before removing at particular index: \(list)")
//let index = 1
//let node = list.node(at: index - 1)!
//let removedValue = list.remove(after: node)

//print("After removing at index \(index): \(list)")
//print("removed Value: " + String(describing: removedValue))



extension LinkedList: Collection {

    //  The startIndex is reasonably defined by the head of the linked list.
    public var startIndex: Index {
        Index(node: head)
    }
    // Collection defines the endIndex as the index right after the last accessible value, so you give it tail?.next.
    public var endIndex: Index {
        Index(node: tail?.next)
    }
    // index(after:) dictates how the index can be incremented. You simply give it an index of the immediate next node.
    public func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }
    // The subscript is used to map an Index to the value in the collection.
    public subscript(position: Index) -> T {
        position.node!.value
    }


    public struct Index: Comparable {
        public var node: Node?

        static public func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }

        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains {$0 === rhs.node}
        }

    }
}


// Example of using collection
//var list = LinkedList<Int>()
//for i in 0...9 {
//    list.append(i)
//}
//
//print("List: \(list)")
//print("Fist element: \(list[list.startIndex])")
//print("Array containing first 3 elements: \(Array(list.prefix(3)))")
//print("Array containing last 3 elements: \(Array(list.suffix(3)))")
//
//let sum = list.reduce(0, +)
//print("Sum of all values: \(sum)")



//var list1 = LinkedList<String>()
//list1.append("Franklin")
//list1.append("baba")
//list1.append("anna")
//
//var list2 = list1
//
//print("List1: \(list1)")
//print("List2: \(list2)")
//
//list2.append("janet")
//
//print("List1: \(list1)")
//print("List2: \(list2)")
//
//print("Removing middle node on list2")
//if let node = list2.node(at: 0) {
//    list2.remove(after: node)
//}
//print("List2: \(list2)")
//




extension LinkedList {
    private mutating func copyNodes() {
        guard !isKnownUniquelyReferenced(&head) else {
            return
        }
        guard var oldNode = head else {
            return
        }

        head = Node(value: oldNode.value)
        var newNode = head

        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        tail = newNode
    }

    private mutating func copyNodes(returningCopyOf node: Node?) -> Node? {
        guard !isKnownUniquelyReferenced(&head) else {
            return nil
        }
        guard var oldNode = head else {
            return nil
        }

        head = Node(value: oldNode.value)
        var newNode = head
        var nodeCopy: Node?

        while let nextOldNode = oldNode.next {
            if oldNode === node {
                nodeCopy = newNode
            }
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        return nodeCopy
    }
}


