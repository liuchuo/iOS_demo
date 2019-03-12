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
                (data: CMAccelerometerData!, err: NSError!) in
                print(data)
            }) // error message：Cannot invoke 'startAccelerometerUpdates' with an argument list of type '(to: OperationQueue, withHandler: (CMAccelerometerData?, NSError?) -> ())'
            
            
        } else {
            print("加速度传感器不可用")
        }
        
        // 获取陀螺仪的数据
        cmm.gyroUpdateInterval = 1
        
        if cmm.isGyroAvailable {
            cmm.startGyroUpdates(to: OperationQueue(), withHandler: {
                (data: CMGyroData!, err: NSError!) in
                print("Gyro data: \(String(describing: data))")
            }) // error message: Cannot invoke 'startGyroUpdates' with an argument list of type '(to: OperationQueue, withHandler: (CMGyroData?, NSError?) -> ())'
        }
        
        // 获取距离传感器的数据
        UIDevice.current.isProximityMonitoringEnabled = true // 将距离传感器置为可用
        NotificationCenter.default.addObserver(self, selector: Selector("proximityChanged"), name: UIDevice.proximityStateDidChangeNotification, object: nil) // 添加监听距离状态的变化
        
        // 获取电源传感器的数据
        UIDevice.current.isBatteryMonitoringEnabled = true // 将电源传感器置为可用
        print("\(UIDevice.current.batteryLevel)") // 获取现在电池的电量（1.0表示充满电了）
        NotificationCenter.default.addObserver(self, selector: Selector("levelChanged"), name: UIDevice.batteryLevelDidChangeNotification, object: nil) // 添加监听电源的变化
    }
    
    func proximityChanged() {
        print(">>>") // 表示程序执行到了这里
        print("\(UIDevice.current.proximityState)") // 输出距离传感器的状态（两种状态，ture / false，即屏幕前面是否有障碍物）
    }
    
    func levelChanged() {
        print("\(UIDevice.current.batteryLevel)")
    }

    override func viewWillDisappear(_ animated: Bool) {
        if cmm.isAccelerometerActive {
            cmm.stopAccelerometerUpdates()
        } // 停止加速度传感器
        
        if cmm.isGyroActive {
            cmm.stopGyroUpdates()
        } // 停止陀螺仪
        
        NotificationCenter.default.removeObserver(self, name: UIDevice.proximityStateDidChangeNotification, object: nil) // 移除距离传感器的监听
        
        NotificationCenter.default.removeObserver(self, name: UIDevice.batteryLevelDidChangeNotification, object: nil) // 移除电源传感器的监听
    }
}

