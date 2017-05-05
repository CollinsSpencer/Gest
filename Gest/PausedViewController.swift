//
//  PausedViewController.swift
//  Gest
//
//  Created by Spencer Collins on 5/3/17.
//  Copyright © 2017 Spencer Collins. All rights reserved.
//

import UIKit

class PausedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
        case "Instructions":
            guard let instructionsViewController = segue.destination as? InstructionsViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            instructionsViewController.source = "Paused"
        
        case "UnwindToGame":
            break
        
        case "UnwindToMain":
            break
            
        default:
            fatalError("Unexpected Segue Identifier: \(segue.identifier ?? "")")
        }
    }
    
    @IBAction func unwindToPaused(segue: UIStoryboardSegue) {
        
    }
    
}
