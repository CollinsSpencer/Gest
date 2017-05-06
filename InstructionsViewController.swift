//
//  InstructionsViewController.swift
//  Gest
//
//  Created by Spencer Collins on 5/3/17.
//  Copyright © 2017 Spencer Collins. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {
    
    // MARK: Properties
    var source: String = "Main"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    @IBAction func back() {
        performSegue(withIdentifier: "unwindTo"+self.source, sender: self)
    }
    
}
