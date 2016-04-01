//
//  AnotherOperation.swift
//  Operations
//
//  Created by Stanislav Shpak on 2/28/16.
//  Copyright © 2016 Stanislav Shpak. All rights reserved.
//

import UIKit

public class AnotherOperation: BaseOperation, AnotherLongTaskDelegate {
    
    override public func start() {
        super.start()
        
        let anotherTask = AnotherLongTask(taskId: self.taskId)
        anotherTask.delegate = self
        anotherTask.doSomething()
    }
    
    func didFinish(task: AnotherLongTask) {
        if (self.cancelled) {
            return
        }
        
        // - Perform completion here if needed -
        
        self.finish()
    }
    
}
