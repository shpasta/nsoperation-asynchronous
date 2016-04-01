//
//  SomeLongTask.swift
//  Operations
//
//  Created by Stanislav Shpak on 2/25/16.
//  Copyright © 2016 Stanislav Shpak. All rights reserved.
//

import UIKit

class SomeLongTask: NSObject {
    
    let taskId: Int
    
    init(taskId: Int) {
        self.taskId = taskId
    }
    
    func doSomethingWithCompletion(completion: (() -> Void)?) {
        NSLog("Task \(self.taskId) started");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            NSLog("Task \(self.taskId) finished");
            if ((completion) != nil) {
                completion!()
            }
        })
    }
    
}
