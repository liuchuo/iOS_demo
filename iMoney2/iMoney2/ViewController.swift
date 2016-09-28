//
//  ViewController.swift
//  iMoney2
//
//  Created by ChenXin on 16/9/28.
//  Copyright © 2016年 ChenXin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // total money UILabel
    @IBOutlet weak var totalMoney: UILabel!
    
    // each money UITextField
    @IBOutlet weak var AliPayText: UITextField!
    @IBOutlet weak var xianjinText: UITextField!
    @IBOutlet weak var DebitCardAText: UITextField!
    @IBOutlet weak var DebitCardBText: UITextField!
    @IBOutlet weak var CreditCardText: UITextField!
    @IBOutlet weak var huabeiText: UITextField!
    @IBOutlet weak var fenqiText: UITextField!
    @IBOutlet weak var zhenxiText: UITextField!
    
    
    // each money user defaults
    var AliPayData : UserDefaults!
    var xianjinData : UserDefaults!
    var DebitCardAData : UserDefaults!
    var DebitCardBData : UserDefaults!
    var CreditCardData : UserDefaults!
    var huabeiData : UserDefaults!
    var fenqiData : UserDefaults!
    var zhenxiData : UserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // each money recover data
        AliPayData = UserDefaults.standard
        if let value = AliPayData.object(forKey: "AliPayKey") {
            AliPayText.text = value as? String
        }
        
        xianjinData = UserDefaults.standard
        if let value = xianjinData.object(forKey: "xianjinKey") {
            xianjinText.text = value as? String
        }
        
        DebitCardAData = UserDefaults.standard
        if let value = DebitCardAData.object(forKey: "DebitCardAKey") {
            DebitCardAText.text = value as? String
        }
        
        DebitCardBData = UserDefaults.standard
        if let value = DebitCardBData.object(forKey: "DebitCardBKey") {
            DebitCardBText.text = value as? String
        }
        
        CreditCardData = UserDefaults.standard
        if let value = CreditCardData.object(forKey: "CreditCardKey") {
            CreditCardText.text = value as? String
        }
        
        huabeiData = UserDefaults.standard
        if let value = huabeiData.object(forKey: "huabeiKey") {
            huabeiText.text = value as? String
        }
        
        fenqiData = UserDefaults.standard
        if let value = fenqiData.object(forKey: "fenqiKey") {
            fenqiText.text = value as? String
        }
        
        zhenxiData = UserDefaults.standard
        if let value = zhenxiData.object(forKey: "zhenxiKey") {
            zhenxiText.text = value as? String
        }
        
    }

    @IBAction func saveBtn(_ sender: AnyObject) {
        
        // each money store data
        AliPayData.set(AliPayText.text, forKey: "AliPayKey")
        xianjinData.set(xianjinText.text, forKey: "xianjinKey")
        DebitCardAData.set(DebitCardAText.text, forKey: "DebitCardAKey")
        DebitCardBData.set(DebitCardBText.text, forKey: "DebitCardBKey")
        CreditCardData.set(CreditCardText.text, forKey: "CreditCardKey")
        huabeiData.set(huabeiText.text, forKey: "huabeiKey")
        fenqiData.set(fenqiText.text, forKey: "fenqiKey")
        zhenxiData.set(zhenxiText.text, forKey: "zhenxiKey")
        
        // each money textfield string to int
        let AliPayInt : Int = Int(AliPayText.text!)!
        let xianjinInt : Int = Int(xianjinText.text!)!
        let DebitCardAInt : Int = Int(DebitCardAText.text!)!
        let CreditCardInt : Int = Int(CreditCardText.text!)!
        let huabeiInt : Int = Int(huabeiText.text!)!
        
        // calculate total money
        let totalInt : Int = AliPayInt + xianjinInt + DebitCardAInt - CreditCardInt - huabeiInt
        
        // total money label text
        totalMoney.text = String(totalInt)

        print("Saved")
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

}

