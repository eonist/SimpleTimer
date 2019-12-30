import XCTest
import SimpleTimer

class SimpleTimerTests: XCTestCase {
   override func setUp() {
      super.setUp()
   }
   override func tearDown() {
      super.tearDown()
   }
   func testExample() {
      XCTAssertEqual("Hello, World!", "Hello, World!")
      let timer = SimpleTimer(interval: 3, repeats: true) { print("tick") }
      timer.start()
   }
   func testPerformanceExample() {
      self.measure { }
   }
}
