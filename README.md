# SimpleTimer:

## What is it:
This is a simple timer class in swift that enables you to

## How does it work:
- [x] Local scoped timer
- [x] Chainable
- [x] One liners
- [x] Uses regular callbacks

## How to get it:

- Carthage: `github "eonist/SimpleTimer" "master"`
- Manual: Copy paste: `SimplerTimer.swift`

## Note:
- Mac apps go into inactive state after 60 secs. Then this timer will slow down.

## Example:

```swift
SimpleTimer(interval: 3, repeats: true){print("tick")}.start()//Ticks every 3 seconds
```

## Example:

```swift
var idx:Int = 0
/**
 * A Timer based on GCD
 * - Note: The can also be used: .seconds(Int), .microseconds(Int) and .nanoseconds(Int)
 */
func timerGCD() -> () {
	DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
		Swift.print("tick: idx\(self.idx)")
		self.idx += 1
		self.timerGCD()
	}
}
```
