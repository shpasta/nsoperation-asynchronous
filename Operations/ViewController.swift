//
//  ViewController.swift
//  Operations
//
//  Created by Stanislav Shpak on 2/25/16.
//  Copyright © 2016 Stanislav Shpak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AnotherLongTaskDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // First type with completion calling
//        let someLongTask = SomeLongTask(taskId: 1)
//        someLongTask.doSomethingWithCompletion({
//            NSLog("completion here")
//        })
//        
//        // Another type with delegate async callback
//        let anotherTask = AnotherLongTask(taskId: 2)
//        anotherTask.delegate = self
//        anotherTask.doSomething()
        
        let queue = NSOperationQueue()
        queue.maxConcurrentOperationCount = 1
        
        let operation_1 = SomeOperation(taskId: 1)
        queue.addOperation(operation_1)
        
        let operation_2 = AnotherOperation(taskId: 2)
        queue.addOperation(operation_2)
        
        let operation_3 = SomeOperation(taskId: 3)
        queue.addOperation(operation_3)
        
    }

    func didFinish(task: AnotherLongTask) {
        NSLog("delegate calls")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



