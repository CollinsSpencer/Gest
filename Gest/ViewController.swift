//
//  ViewController.swift
//  Gest
//
//  Created by Spencer Collins on 4/28/17.
//  Copyright © 2017 Spencer Collins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    var numberOfTouches: Int = 1
    var option: Int = 0
    @IBOutlet weak var AboutMeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        AboutMeButton.layer.cornerRadius = 0.5 * AboutMeButton.bounds.size.height
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
            gameViewController.option = option
            gameViewController.numberOfTouches = numberOfTouches
            
        case "Five":
            guard let gameViewController = segue.destination as? GameViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            gameViewController.gameCount = 5
            gameViewController.option = option
            gameViewController.numberOfTouches = numberOfTouches
            
        case "Seven":
            guard let gameViewController = segue.destination as? GameViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            gameViewController.gameCount = 7
            gameViewController.option = option
            gameViewController.numberOfTouches = numberOfTouches
        
        case "Instructions":
            guard let instructionsViewController = segue.destination as? InstructionsViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            instructionsViewController.source = "Main"
            
        case "AboutMe":
            break
            
        case "Settings":
            guard let settingsViewController = segue.destination as? SettingsViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            settingsViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            settingsViewController.preferredContentSize = CGSize(width: 350, height: 350)
            
            settingsViewController.popoverPresentationController?.sourceView = self.view
            settingsViewController.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            settingsViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
            
            settingsViewController.touchedIndex = numberOfTouches - 1
            
        default:
            fatalError("Unexpected Segue Identifier: \(segue.identifier ?? "")")
        }
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        
    }


}

