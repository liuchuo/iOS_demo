//
//  ViewController.swift
//  demo14_CoreLocation
//
//  Created by liuchuo on 2019/3/7.
//  Copyright © 2019 liuchuo. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var lm: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lm = CLLocationManager()
        lm.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lm.startUpdatingHeading()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print(newHeading) // 呈现的数据从正北方向开始顺时针（上北下南左西右东）maneticHeading为0-360
    }

}

