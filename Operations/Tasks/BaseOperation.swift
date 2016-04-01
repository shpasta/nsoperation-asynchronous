//
//  BaseOperation.swift
//  Operations
//
//  Created by Stanislav Shpak on 2/28/16.
//  Copyright © 2016 Stanislav Shpak. All rights reserved.
//

import UIKit

public class BaseOperation: NSOperation {

    private var _cancelled: Bool!
    override private(set) public var cancelled: Bool {
        get {
            return _cancelled
        }
        set {
            if (newValue != _cancelled) {
                self.willChangeValueForKey("isCancelled")
                _cancelled = newValue
                self.didChangeValueForKey("isCancelled")
            }
        }
    }
    
    private var _executing: Bool!
    override private(set) public var executing: Bool {
        get {
            return _executing
        }
        set {
            if (newValue != _executing) {
                self.willChangeValueForKey("isExecuting")
                _executing = newValue
                self.didChangeValueForKey("isExecuting")
            }
        }
    }
    
    private var _finished: Bool!
    override private(set) public var finished: Bool {
        get {
            return _finished
        }
        set {
            if (newValue != _finished) {
                self.willChangeValueForKey("isFinished")
                _finished = newValue
                self.didChangeValueForKey("isFinished")
            }
        }
    }
    
    private var _ready: Bool!
    override private(set) public var ready: Bool {
        get {
            return _ready
        }
        set {
            if (newValue != _ready) {
                self.willChangeValueForKey("isReady")
                _ready = newValue
                self.didChangeValueForKey("isReady")
            }
        }
    }
    
    override public var asynchronous: Bool {
        get {
            return true
        }
    }
    
    var taskId: Int
    
    init(taskId: Int) {
        
        self.taskId = taskId
        
        _ready = true
        _executing = false
        _cancelled = false
        _finished = false
    }
    
    override public func start() {
        NSLog("Operation started")
        
        self.ready = false
        self.executing = true
        self.cancelled = false
        self.finished = false
        
        // This method should be overriden
    }
    
    func finish() {
        NSLog("Operation finished")
        
        self.ready = false
        self.executing = false
        self.cancelled = false
        self.finished = true
    }
    
    override public func cancel() {
        NSLog("Operation cancelled")
        
        self.ready = false
        self.executing = false
        self.cancelled = true
        self.finished = false
    }
    
    @nonobjc
    func foo(arg: Int) {
        
    }
    
    @nonobjc
    func foo(arg: String) {
        
    }
    
}
