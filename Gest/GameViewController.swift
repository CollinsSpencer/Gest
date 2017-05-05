//
//  GameViewController.swift
//  Gest
//
//  Created by Spencer Collins on 5/3/17.
//  Copyright © 2017 Spencer Collins. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var gameCount = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        drawLines()
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

    @IBAction func unwindToGame(segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
        case "Pause":
            guard let pausedViewController = segue.destination as? PausedViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            pausedViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            pausedViewController.preferredContentSize = CGSize(width: 350, height: 350)
            
            pausedViewController.popoverPresentationController?.sourceView = self.view
            pausedViewController.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            pausedViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
            
        default:
            fatalError("Unexpected Segue Identifier: \(segue.identifier ?? "")")
        }
    }
    
    
    // MARK: View
    
//    func drawLines() {
//        let path = UIBezierPath()
//        
//        path.move(to: CGPoint(x: 50, y: 50))
//        path.addLine(to: CGPoint(x: 200, y: 50))
//        
//        path.close()
//        
//        UIColor.darkGray.set()
//        path.stroke()
//        path.fill()
//    }
    
}
