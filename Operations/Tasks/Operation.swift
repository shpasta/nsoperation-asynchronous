//
//  SomeOperation.swift
//  Operations
//
//  Created by Stanislav Shpak on 2/28/16.
//  Copyright © 2016 Stanislav Shpak. All rights reserved.
//

import UIKit

public class Operation: BaseOperation {
    
    var task: Task?
    
    override public func start() {
        super.start()
        
        task = Task(taskId: self.taskId)
        task?.performWithCompletion({[weak self] in
            guard let strongSelf = self else { return }
            if (strongSelf.cancelled) {
                return
            }
            strongSelf.finish()
        })
    }
}
