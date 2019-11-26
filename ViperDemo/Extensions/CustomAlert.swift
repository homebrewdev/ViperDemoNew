//
//  CustomAlert.swift
//  ViperDemo
//
//  Created by riff on 09/10/2019.
//  Copyright © 2019 Abhisek. All rights reserved.
//

import UIKit

// for use - UIAlertController.showAlert(title:"Title", msg:"Message", target: self)
extension UIAlertController {
     class func showAlert(title:String, msg:String, target: UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
            (result: UIAlertAction) -> Void in
        })
        target.present(alert, animated: true, completion: nil)
    }
}
