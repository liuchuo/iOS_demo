//
//  ViewController.swift
//  demo13_CoreMotion
//
//  Created by liuchuo on 2019/3/7.
//  Copyright © 2019 liuchuo. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var cmm: CMMotionManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cmm = CMMotionManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // 获取加速度传感器的数据
        cmm.accelerometerUpdateInterval = 1
        
        if cmm.isAccelerometerAvailable {
            cmm.startAccelerometerUpdates(to: OperationQueue(), withHandler: {
                (data: CMAccelerometerData?, err: NSError?) in
                print(data)
            }) // error message：Cannot invoke 'startAccelerometerUpdates' with an argument list of type '(to: OperationQueue, withHandler: (CMAccelerometerData?, NSError?) -> ())'
            
            
        } else {
            print("加速度传感器不可用")
        }
        
        // 获取陀螺仪的数据
        
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        if cmm.isAccelerometerActive {
            cmm.stopAccelerometerUpdates()
        }
    }
}

