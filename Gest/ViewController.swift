//
//  ViewController.swift
//  Gest
//
//  Created by Spencer Collins on 4/28/17.
//  Copyright © 2017 Spencer Collins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print()
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
        case "Three":
            guard let gameViewController = segue.destination as? GameViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            gameViewController.gameCount = 3
            
        case "Five":
            guard let gameViewController = segue.destination as? GameViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            gameViewController.gameCount = 5
            
        case "Seven":
            guard let gameViewController = segue.destination as? GameViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            gameViewController.gameCount = 7
        
        case "Instructions":
            guard let instructionsViewController = segue.destination as? InstructionsViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            instructionsViewController.source = "Main"
            
        case "AboutMe":
            break
            
        default:
            fatalError("Unexpected Segue Identifier: \(segue.identifier ?? "")")
        }
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        
    }


}

