//
//  SomeOperation.swift
//  Operations
//
//  Created by Stanislav Shpak on 2/28/16.
//  Copyright © 2016 Stanislav Shpak. All rights reserved.
//

import UIKit

public class SomeOperation: BaseOperation {
    
    override public func start() {
        super.start()
        
        let someLongTask = SomeLongTask(taskId: self.taskId)
        someLongTask.doSomethingWithCompletion({
            if (self.cancelled) {
                return
            }
            
            // - Perform completion here if needed -
            
            self.finish()
        })
    }
}
