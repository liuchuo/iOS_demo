//
//  UserContentViewController.swift
//  demo8_CoreData
//
//  Created by ChenXin on 2016/11/22.
//  Copyright © 2016年 ChenXin. All rights reserved.
//

import UIKit
import CoreData

class UserContentViewController: UIViewController {

    var data:NSManagedObject!
    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tf1.text = data.value(forKey: "attribute1") as! String?
        tf2.text = data.value(forKey: "attribute2") as! String?
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitBtnPressed(_ sender: AnyObject) {
        data.setValue(tf1.text, forKey: "attribute1")
        data.setValue(tf2.text, forKey: "attribute2")
        
        try! data.managedObjectContext?.save()
        
        dismiss(animated: true, completion: nil)
    
    }

    @IBAction func cancelBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
