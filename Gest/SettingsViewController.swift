//
//  SettingsViewController.swift
//  Gest
//
//  Created by Spencer Collins on 5/5/17.
//  Copyright © 2017 Spencer Collins. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var touchesSegment: UISegmentedControl!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var optionIndex = 0
    var touchedIndex = 0
    
    var options = ["Single Tap", "Double Tap", "Long Press", "Swipe Left", "Swipe Right", "Swipe Up", "Swipe Down"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        touchesSegment.selectedSegmentIndex = touchedIndex

        pickerView.delegate = self
        pickerView.dataSource = self
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
        case "BackToMain":
            break
            
        case "SaveToMain":
            guard let mainViewController = segue.destination as? ViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            mainViewController.numberOfTouches = touchesSegment.selectedSegmentIndex + 1
            mainViewController.option = optionIndex
            
            
        default:
            fatalError("Unexpected Segue Identifier: \(segue.identifier ?? "")")
        }
    }
    
    
    // MARK: Implement parent functions
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        optionIndex = row
    }
    
}
