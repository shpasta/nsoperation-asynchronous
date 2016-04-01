//
//  AnotherLongTask.swift
//  Operations
//
//  Created by Stanislav Shpak on 2/25/16.
//  Copyright © 2016 Stanislav Shpak. All rights reserved.
//

import UIKit

protocol AnotherLongTaskDelegate: class {
    func didFinish(task: AnotherLongTask)
}

class AnotherLongTask: NSObject {
    
    let taskId: Int
    weak var delegate: AnotherLongTaskDelegate?

    init(taskId: Int) {
        self.taskId = taskId
    }
    
    func doSomething() {
        NSLog("Task \(self.taskId) started");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            NSLog("Task \(self.taskId) finished");
            if (self.delegate != nil) {
                self.delegate?.didFinish(self)
            }
        })
    }
}
