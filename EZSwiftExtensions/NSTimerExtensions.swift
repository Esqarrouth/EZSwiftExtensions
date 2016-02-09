//
//  ArrayExtensions.swift
//  EZSwiftExtensions
//
//  Created by Goktug Yilmaz on 15/07/15.
//  Copyright (c) 2015 Goktug Yilmaz. All rights reserved.
//
import UIKit

extension NSTimer
{
  /// EZSwiftExtensions - Runs every second, to cancel use: timer.invalidate()
  public static func runThisEvery(seconds seconds: NSTimeInterval, handler: NSTimer! -> Void) -> NSTimer {
    let fireDate =  CFAbsoluteTimeGetCurrent()
    let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, seconds, 0, 0, handler)
    CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes)
    return timer
  }
  
  /// EZSwiftExtensions
  public static func runThisAfterDelay(seconds seconds: Double, after: () -> ()) {
    runThisAfterDelay(seconds: seconds, queue: dispatch_get_main_queue(), after: after)
  }
  
  //TODO: Make this easier
  /// EZSwiftExtensions - dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
  public static func runThisAfterDelay(seconds seconds: Double, queue: dispatch_queue_t, after: ()->()) {
    let time = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
    dispatch_after(time, queue, after)
  }
}

