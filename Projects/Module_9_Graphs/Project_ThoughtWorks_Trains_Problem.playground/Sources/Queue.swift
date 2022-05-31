protocol Queue: Sequence, IteratorProtocol {
  associatedtype Element
  var isEmpty: Bool { get }
  var peek: Element? { get }
  mutating func enqueue(_ element: Element)
  mutating func dequeue() -> Element?
}

extension Queue {
  mutating func next() -> Element? {
    return dequeue()
  }
}
