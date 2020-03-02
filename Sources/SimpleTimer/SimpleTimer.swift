import Foundation
/**
 * - Important: ⚠️️ @objc func update() {Swift.print("tick")}//method must be in the public or scope
 * - Important: ⚠️️ because your object has a property to store the timer, and the timer calls a method on the object, you have a strong reference cycle that means neither object can be freed. To fix this, make sure you invalidate the timer when you're done with it, such as when your view is about to disappear: timer.invalidate()
 * ## Examples:
 * SimpleTimer(interval: 3, repeats: true) { print("tick") }.start() // ticks every 3 seconds
 */
open class SimpleTimer {
   private var timer: Timer?
   public var interval: TimeInterval // in seconds
   public var repeats: Bool
   public var tick: Tick // - Fixme: ⚠️️ Possibly rename to onChange etc
   public init(interval: TimeInterval, repeats: Bool = false, onTick:@escaping Tick) {
      self.interval = interval
      self.repeats = repeats
      self.tick = onTick
   }
}
/**
 * Core
 */
extension SimpleTimer {
   /**
    * Starts the timer
    * - Note: start() starts the timer only if it's nil
    */
   @objc open func start() {
      if timer == nil {
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(update), userInfo: nil, repeats: repeats)
     } else {
        fatalError("Unable to start a timer that hasnt been invalidated and set to nil, aka stopped")
     }
   }
   /**
    * Stops the timer
    * - Note:  stop() stops it only if it's not nil.
    * - Important: Special Considerations You must send this message from the thread on which the timer was installed. If you send this message from another thread, the input source associated with the timer may not be removed from its run loop, which could prevent the thread from exiting properly.
    */
   @objc open func stop() {
      if timer != nil {
         timer?.invalidate()
         timer = nil
      } else {
        fatalError("Unable to stop a timer that hasnt been started")
      }
   }
   /**
    * Resets the timer
    */
   @objc open func reset() {
      stop()
      start()
   }
   /**
    * This method must be in the public or scope
    */
   @objc open func update() {
      tick()
   }
}
/**
 * Type
 */
extension SimpleTimer {
   /**
    * Callback type (Equivilent to onChange)
    */
   public typealias Tick = () -> Void
}
