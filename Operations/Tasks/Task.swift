//
//  SomeLongTask.swift
//  Operations
//
//  Created by Stanislav Shpak on 2/25/16.
//  Copyright © 2016 Stanislav Shpak. All rights reserved.
//

import UIKit

class Task {
    
    let taskId: Int
    
    init(taskId: Int) {
        self.taskId = taskId
    }
    
    func performWithCompletion(completion: (() -> ())?) {
        NSLog("Task with id \(self.taskId) started");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            [weak self] in
            if let taskId = self?.taskId {
                NSLog("Task with id \(taskId) finished");
            }
            completion?()
        })
    }
}
