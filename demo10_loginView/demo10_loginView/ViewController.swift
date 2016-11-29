//
//  ViewController.swift
//  demo10_loginView
//
//  Created by ChenXin on 2016/11/29.
//  Copyright © 2016年 ChenXin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var rememberSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //把上次保存的用户名和密码信息读取到文本框里面
        self.userName.text = UserDefaults.standard.value(forKey: "UserName") as! String!
        self.password.text = UserDefaults.standard.value(forKey: "Password") as! String!
        self.rememberSwitch.isOn = UserDefaults.standard.bool(forKey: "RememberSwitch") as Bool!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButton(_ sender: Any) {
        
        //如果用户改了信息，还是要再次把用户名 密码 和状态都存储起来
        UserDefaults.standard.setValue(self.userName.text, forKey: "UserName")
        UserDefaults.standard.setValue(self.password.text, forKey: "Password")
        UserDefaults.standard.set(self.rememberSwitch.isOn, forKey: "RememberSwitch")
        //同步一下
        UserDefaults.standard.synchronize()
        //如果这个时候首次点了记住密码 那么要把上面的记住密码保存一下的，如果点了取消记住密码，要把密码清空
        if(self.rememberSwitch.isOn) {
            self.password.text = UserDefaults.standard.value(forKey: "Password") as! String!
        } else {
            UserDefaults.standard.setValue("", forKey: "UserName")
            UserDefaults.standard.setValue("", forKey: "Password")
        }

        
    }

}

