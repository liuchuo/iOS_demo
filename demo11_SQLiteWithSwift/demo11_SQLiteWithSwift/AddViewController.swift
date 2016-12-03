//
//  AddViewController.swift
//  demo11_SQLiteWithSwift
//
//  Created by ChenXin on 2016/12/2.
//  Copyright © 2016年 ChenXin. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var idNum: UITextField!
    @IBOutlet weak var stuName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneBtn(_ sender: Any) {
        // 写入数据库的操作代码
        let idNumText : String = idNum.text!
        let stuNameText : String = stuName.text!
        let insertSQL = "INSERT INTO 't_Student' (stuNum, stuName) VALUES ('\(idNumText)', '\(stuNameText)');"
        if SQLManager.shareInstance().execSQL(SQL: insertSQL) == true {
            print("插入数据add成功")
        }
        
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
