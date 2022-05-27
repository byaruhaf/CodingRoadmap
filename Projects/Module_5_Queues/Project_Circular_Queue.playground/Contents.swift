import XCTest

class MyCircularQueue {

    private var values: [Int]
    private let capacity: Int

    init(_ k: Int) {
        capacity = k
        values = []
    }

    //Gets the front item from the queue
    func Front() -> Int {
        return values.first ?? -1
    }

    //Gets the last item from the queue.
    func Rear() -> Int {
        return values.last ?? -1
    }

    //Inserts an element into the circular queue.
    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else { return false }
        values.append(value)
        return true
    }

    //Deletes an element from the circular queue.
    func deQueue() -> Bool {
        guard !isEmpty() else { return false }
        values.removeFirst()
        return true
    }

    //Checks whether the circular queue is empty or not.
    func isEmpty() -> Bool {
        return values.isEmpty
    }

    //Checks whether the circular queue is full or not
    func isFull() -> Bool {
        return values.count == capacity
    }
}


/// Unit Tests for Solution Class.
class ProjectTests: XCTestCase {
    var myCircularQueue: MyCircularQueue!

    override func setUp() {
        super.setUp()
        myCircularQueue = MyCircularQueue(3)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample1() {
        print("                ")
        print("[Test Example 1]")

        let o1 = myCircularQueue.enQueue(1) // return true
        let o2 = myCircularQueue.enQueue(2) // return true
        let o3 = myCircularQueue.enQueue(3) // return true
        let o4 = myCircularQueue.enQueue(4) // return false
        let o5 = myCircularQueue.Rear()     // return 3
        let o6 = myCircularQueue.isFull()   // return true
        let o7 = myCircularQueue.deQueue()  // return true
        let o8 = myCircularQueue.enQueue(4) // return true
        let o9 = myCircularQueue.Rear()     // return 4

        XCTAssert((o1,o2,o3,o4,o5,o6) == (true,true,true,false,3,true))
        XCTAssert((o7,o8,o9) == (true,true,4))
    }
}

class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        print("                                                                   ")
        print("*******************************************************************")
        print("Test failed on line \(lineNumber): \(testCase.name), \(description)")
        print("*******************************************************************")
        print("                                                                   ")
    }
}

let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
ProjectTests.defaultTestSuite.run()


