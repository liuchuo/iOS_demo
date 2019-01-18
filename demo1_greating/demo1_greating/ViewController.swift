//
//  ViewController.swift
//  demo1_greating
//
//  Created by ChenXin on 16/9/16.
//  Copyright © 2016年 ChenXin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func greeting(_ sender: AnyObject) {
        self.messageLabel.text = "你好呀，" + self.nameField.text! + "~很高兴认识你~"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 设置App的launch加载时间为1秒
        Thread.sleep(forTimeInterval: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

