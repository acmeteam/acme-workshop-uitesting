//
//  Extensions.swift
//  TestingExamples
//
//  Created by Andrija Milovanovic on 5/30/16.
//  Copyright © 2016 Andrija. All rights reserved.
//


import Foundation

extension NSTimer
{
    
    // MARK: Schedule timers
    
    /// Create and schedule a timer that will call `block` once after the specified time.
    
    public class func after(interval: NSTimeInterval, _ block: () -> Void) -> NSTimer {
        let timer = NSTimer.new(after: interval, block)
        timer.start()
        return timer
    }
    
    /// Create and schedule a timer that will call `block` repeatedly in specified time intervals.
    
    public class func every(interval: NSTimeInterval, _ block: () -> Void) -> NSTimer {
        let timer = NSTimer.new(every: interval, block)
        timer.start()
        return timer
    }
    
    /// Create and schedule a timer that will call `block` repeatedly in specified time intervals.
    /// (This variant also passes the timer instance to the block)
    
    @nonobjc public class func every(interval: NSTimeInterval, _ block: NSTimer -> Void) -> NSTimer {
        let timer = NSTimer.new(every: interval, block)
        timer.start()
        return timer
    }
    
    // MARK: Create timers without scheduling
    
    /// Create a timer that will call `block` once after the specified time.
    ///
    /// - Note: The timer won't fire until it's scheduled on the run loop.
    ///         Use `NSTimer.after` to create and schedule a timer in one step.
    /// - Note: The `new` class function is a workaround for a crashing bug when using convenience initializers (rdar://18720947)
    
    public class func new(after interval: NSTimeInterval, _ block: () -> Void) -> NSTimer {
        return CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, CFAbsoluteTimeGetCurrent() + interval, 0, 0, 0) { _ in
            block()
        }
    }
    
    /// Create a timer that will call `block` repeatedly in specified time intervals.
    ///
    /// - Note: The timer won't fire until it's scheduled on the run loop.
    ///         Use `NSTimer.every` to create and schedule a timer in one step.
    /// - Note: The `new` class function is a workaround for a crashing bug when using convenience initializers (rdar://18720947)
    
    public class func new(every interval: NSTimeInterval, _ block: () -> Void) -> NSTimer {
        return CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, CFAbsoluteTimeGetCurrent() + interval, interval, 0, 0) { _ in
            block()
        }
    }
    
    /// Create a timer that will call `block` repeatedly in specified time intervals.
    /// (This variant also passes the timer instance to the block)
    ///
    /// - Note: The timer won't fire until it's scheduled on the run loop.
    ///         Use `NSTimer.every` to create and schedule a timer in one step.
    /// - Note: The `new` class function is a workaround for a crashing bug when using convenience initializers (rdar://18720947)
    
    @nonobjc public class func new(every interval: NSTimeInterval, _ block: NSTimer -> Void) -> NSTimer {
        var timer: NSTimer!
        timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, CFAbsoluteTimeGetCurrent() + interval, interval, 0, 0) { _ in
            block(timer)
        }
        return timer
    }
    
    // MARK: Manual scheduling
    
    /// Schedule this timer on the run loop
    ///
    /// By default, the timer is scheduled on the current run loop for the default mode.
    /// Specify `runLoop` or `modes` to override these defaults.
    
    public func start(runLoop runLoop: NSRunLoop = NSRunLoop.currentRunLoop(), modes: String...) {
        let modes = modes.isEmpty ? [NSDefaultRunLoopMode] : modes
        
        for mode in modes {
            runLoop.addTimer(self, forMode: mode)
        }
    }
}

// MARK: - Time extensions

extension Double {
    public var millisecond: NSTimeInterval  { return self / 1000 }
    public var milliseconds: NSTimeInterval { return self / 1000 }
    public var ms: NSTimeInterval           { return self / 1000 }
    
    public var second: NSTimeInterval       { return self }
    public var seconds: NSTimeInterval      { return self }
    
    public var minute: NSTimeInterval       { return self * 60 }
    public var minutes: NSTimeInterval      { return self * 60 }
    
    public var hour: NSTimeInterval         { return self * 3600 }
    public var hours: NSTimeInterval        { return self * 3600 }
    
    public var day: NSTimeInterval          { return self * 3600 * 24 }
    public var days: NSTimeInterval         { return self * 3600 * 24 }
}
