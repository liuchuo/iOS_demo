//
//  ViewController.swift
//  demo17_UserDefault
//
//  Created by liuchuo on 2019/3/13.
//  Copyright © 2019 liuchuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputText: UITextView!
   
    @IBOutlet weak var mySwitch: UISwitch!
    
    var ud: UserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ud = UserDefaults.standard
        
        // 读取用户首选项数据
        if let value = ud.object(forKey: "data") {
            inputText.text = (value as! String)
        } else {
            inputText.text = "No Value"
        }
        
        // 每次打开App读取用户设置的开关状态
        mySwitch.setOn(ud.bool(forKey: "showTips"), animated: true)

    }
    
    // 如果开关的值改变，就将值赋值给UserDefaults，并根据开关的值显示提示
    @IBAction func valueChangedHandler(_ sender: Any) {
        
        ud.set(mySwitch.isOn, forKey: "showTips")
        
        if mySwitch.isOn {
            let alertController = UIAlertController(title: "title标题", message: "message内容", preferredStyle: UIAlertController.Style.alert)

            let cancelAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
            let okAction = UIAlertAction(title: "好的", style: UIAlertAction.Style.default, handler: nil)
            let resetAction = UIAlertAction(title: "重置", style: UIAlertAction.Style.destructive, handler: nil)

            alertController.addAction(resetAction)
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)

            self.present(alertController, animated: true, completion: nil)
       }
    }
    
    // 保存用户首选项数据
    @IBAction func saveBtnPressed(_ sender: Any) {
        ud.set(inputText.text, forKey: "data")
        print("saved")
        let alertController = UIAlertController(title: "title标题", message: "message内容", preferredStyle: UIAlertController.Style.alert)
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: UIAlertAction.Style.default, handler: nil)
        let resetAction = UIAlertAction(title: "重置", style: UIAlertAction.Style.destructive, handler: nil)

        alertController.addAction(resetAction)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

