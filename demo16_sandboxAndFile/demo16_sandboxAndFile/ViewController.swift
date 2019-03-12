//
//  ViewController.swift
//  demo16_sandboxAndFile
//
//  Created by liuchuo on 2019/3/13.
//  Copyright © 2019 liuchuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 在沙盒中写入文件
        var sp = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        if sp.count > 0 {
            let url = NSURL(fileURLWithPath: "\(sp[0])/data.txt")
            print(url)
            let data = NSMutableData()
            data.append("Hello Swift\n".data(using: String.Encoding.utf8, allowLossyConversion: true)!)
            data.write(toFile: url.path!, atomically: true)
            
            // 用命令行的open命令打开输出的url即可看到data.txt文件中的内容
            
            // 在沙盒中读取文件
            let str1 = try? NSString(contentsOf: url as URL, encoding: String.Encoding.utf8.rawValue)
            print(str1!)
        }
        
    }
    
}

