//
//  ViewController.swift
//  iMoney2
//
//  Created by ChenXin on 16/9/28.
//  Copyright © 2016年 ChenXin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalMoney: UILabel!
    
    
    @IBOutlet weak var AliPayText: UITextField!
    @IBOutlet weak var xianjinText: UITextField!
    
    
    var AliPayData : UserDefaults!
    var xianjinData : UserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        AliPayData = UserDefaults.standard
        if let value = AliPayData.object(forKey: "AliPayKey") {
            AliPayText.text = value as? String
        }
        
        xianjinData = UserDefaults.standard
        if let value = xianjinData.object(forKey: "xianjinKey") {
            xianjinText.text = value as? String
        }
        
        
    }

    @IBAction func saveBtn(_ sender: AnyObject) {
        AliPayData.set(AliPayText.text, forKey: "AliPayKey")
        xianjinData.set(AliPayText.text, forKey: "xianjinKey")
        
        var AliPayInt : Int = Int(AliPayText.text!)!
        var xianjinInt : Int = Int(xianjinText.text!)!
        
        var totalInt : Int = AliPayInt + xianjinInt
        
        totalMoney.text = String(totalInt)

        print("Saved")
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

}

