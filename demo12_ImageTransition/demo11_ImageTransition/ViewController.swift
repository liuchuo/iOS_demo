//
//  ViewController.swift
//  demo11_ImageTransition
//
//  Created by liuchuo on 2019/3/4.
//  Copyright © 2019 liuchuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var img1View: UIImageView!
    @IBOutlet var img2View: UIImageView!
    private var flag: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(img1View)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // 实现两张图片轮流点击翻转
        func completeHandler(v: Bool) {
            flag = !flag
        }
        
        if flag {
            UIView.transition(from: img1View, to: img2View, duration: 1.0, options: .transitionFlipFromRight, completion: completeHandler)
        } else {
            UIView.transition(from: img2View, to: img1View, duration: 1.0, options: .transitionFlipFromLeft, completion: completeHandler)
        }
        
        // 实现翻页动画效果
//        UIView.beginAnimations(nil, context: nil)
//        UIView.setAnimationTransition(.curlUp, for: img1View, cache: true)
//        UIView.setAnimationDuration(1.0)
//        UIView.commitAnimations()
        
        // 实现自定义动画效果
//        func anim() {
//            img1View.alpha = 0.5
//        }
//        
//        UIView.transition(with: img1View, duration: 1.0, options: .transitionFlipFromTop, animations: anim, completion: nil)
        
    }

}

