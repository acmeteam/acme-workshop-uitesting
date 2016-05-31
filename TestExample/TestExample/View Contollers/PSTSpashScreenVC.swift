//
//  PSTSpashScreenVC.swift
//  TestExample
//
//  Created by Andrija Milovanovic on 5/31/16.
//  Copyright © 2016 Andrija. All rights reserved.
//

import UIKit

class PSTSpashScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NSTimer.after(4) {
            if AppDelegate.isFirstTime || true {
                self.performSegueWithIdentifier("present_welcome", sender: self)
            } else {
                self.performSegueWithIdentifier("present_app_from_splash", sender:self)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
