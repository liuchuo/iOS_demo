//
//  StudentModel.swift
//  demo11_SQLiteWithSwift
//
//  Created by ChenXin on 2016/12/2.
//  Copyright © 2016年 ChenXin. All rights reserved.
//

import UIKit

class StudentModel: NSObject {
    var idNum : String = ""
    var stuName : String = ""
    
    init(idNum : String, stuName : String) {
            self.idNum = idNum
            self.stuName = stuName
    }
    
    override init() {
        super.init()
    }
}
