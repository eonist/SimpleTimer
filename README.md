# SimpleTimer:

![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg) ![platform](https://img.shields.io/badge/Platform-iOS-blue.svg) ![platform](https://img.shields.io/badge/Platform-macOS-blue.svg) ![Lang](https://img.shields.io/badge/Language-Swift%205.0-orange.svg)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift)
[![codebeat badge](https://codebeat.co/badges/86b27d85-9e33-4632-b003-09a4c50deec2)](https://codebeat.co/projects/github-com-eonist-simpletimer-master)
![Tests](https://github.com/eonist/SimpleTimer/workflows/Tests/badge.svg)

## Features:
- [x] Local scoped timer
- [x] Chainable
- [x] One liners
- [x] Uses regular callbacks

## Installation:

- SPM: `url: "github/eonist/SimpleTimer.git" .branch: "master"`
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
 * A Timer based on GCD (More reliable as it doesn't freeze if main thread is frozen)
 * - Note: The can also be used: .seconds(Int), .microseconds(Int) and .nanoseconds(Int)
 */
func timerGCD() -> () {
	DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
		Swift.print("tick: idx\(self.idx)")
		self.idx += 1
		if self.idx < 10 {self.timerGCD()}//stop at 1sec
	}
}
```
