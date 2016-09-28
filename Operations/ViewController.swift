//
//  ViewController.swift
//  Operations
//
//  Created by Stanislav Shpak on 2/25/16.
//  Copyright © 2016 Stanislav Shpak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queue = NSOperationQueue()
        queue.maxConcurrentOperationCount = 1
        
        for index in 0...2 {
            let operation = Operation(taskId: index)
            queue.addOperation(operation)
            
            if index == 1 {
                operation.cancel()
            }
        }
    }
}



