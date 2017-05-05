//
//  GameWonViewController.swift
//  Gest
//
//  Created by Spencer Collins on 5/4/17.
//  Copyright © 2017 Spencer Collins. All rights reserved.
//

import UIKit

class GameWonViewController: UIViewController {

    @IBOutlet weak var finalScoreBoard: UILabel!
    var finalScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        finalScoreBoard.text = String(finalScore)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
