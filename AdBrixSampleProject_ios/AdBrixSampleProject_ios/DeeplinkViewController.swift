//
//  DeeplinkViewController.swift
//  AdBrixSampleProject_ios
//
//  Created by Jin-uk Park on 2021/03/31.
//

import UIKit
import AdBrixRM

class DeeplinkViewController : UIViewController {
    
    let adbrix = AdBrixRM.getInstance
    
    override func viewDidLoad() {
        adbrix.event(eventName: "deeplinkViewOpen")
    }
    
    @IBAction func goBackToMain(_ sender: Any) {
        
        let returnMainView = self.storyboard?.instantiateViewController(identifier: "Main")
        returnMainView?.modalTransitionStyle = .coverVertical
        self.present(returnMainView!, animated: true, completion: nil)
    }
    
    
}
