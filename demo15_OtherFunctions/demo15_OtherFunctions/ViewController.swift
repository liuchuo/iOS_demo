//
//  ViewController.swift
//  demo15_OtherFunctions
//
//  Created by liuchuo on 2019/3/10.
//  Copyright © 2019 liuchuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBAction func openURLBtnPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.liuchuo.net/")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func sendMailBtnPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: "mailto:xxx@liuchuo.net")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func makeCallBtnPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: "tel:10086")!, options: [:], completionHandler: nil)
    }
    
    
    @IBAction func sendSMSBtonPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: "sms:10086")!, options: [:], completionHandler: nil)
    }
    
    @IBOutlet weak var iv: UIImageView!
    
    @IBAction func getImageBtnPressed(_ sender: Any) {
        let c = UIImagePickerController()
        c.sourceType = UIImagePickerController.SourceType.photoLibrary
        c.delegate = self
        self.present(c, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image: UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        iv.image = image
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

