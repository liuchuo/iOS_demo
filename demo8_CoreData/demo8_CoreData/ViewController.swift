//
//  ViewController.swift
//  demo8_CoreData
//
//  Created by ChenXin on 2016/11/19.
//  Copyright © 2016年 ChenXin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var row:AnyObject = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        row.setValue("female", forKey: "attribute1")
        row.setValue("xcxnxn", forKey: "attribute2")
        
        do {
            try context.save()
        }catch {
            
        }
        
        print("run here")
        
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

