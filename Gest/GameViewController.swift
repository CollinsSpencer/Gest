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
    var goingBack:Bool = false
    var gestures = [GestureOption]()
    var score: Int = 10
    var numberOfTouches: Int = 1
    var option: Int = 1
    @IBOutlet weak var progressBar: ProgressBar!
    @IBOutlet weak var scoreBoard: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreBoard.text = String(score)
        
        setupProgressBar()

        initializeGestureOptions()
        
        printGestureOptions()
        
        initializeGestureRecognizers()
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
        case "Pause":
            guard let pausedViewController = segue.destination as? PausedViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            pausedViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            pausedViewController.preferredContentSize = CGSize(width: 350, height: 350)
            
            pausedViewController.popoverPresentationController?.sourceView = self.view
            pausedViewController.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            pausedViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        
        case "GameWon":
            guard let gameWonViewController = segue.destination as? GameWonViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            gameWonViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            gameWonViewController.preferredContentSize = CGSize(width: 350, height: 350)
            
            gameWonViewController.popoverPresentationController?.sourceView = self.view
            gameWonViewController.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            gameWonViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
            
            gameWonViewController.finalScore = score
        
        case "GameLost":
            guard let gameLostViewController = segue.destination as? GameLostViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            gameLostViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            gameLostViewController.preferredContentSize = CGSize(width: 350, height: 350)
            
            gameLostViewController.popoverPresentationController?.sourceView = self.view
            gameLostViewController.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            gameLostViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
            
        default:
            fatalError("Unexpected Segue Identifier: \(segue.identifier ?? "")")
        }
    }
    
    @IBAction func unwindToGame(segue: UIStoryboardSegue) {
        
    }
    
    
    // MARK: Gesture Recognizers
    
    func singleTap(_ sender: UITapGestureRecognizer) {
        gestureProcessor(gestureId: 0, point: sender.location(in: self.view), numberOfTouches: sender.numberOfTouches)
    }
    
    func doubleTap(_ sender: UITapGestureRecognizer) {
        gestureProcessor(gestureId: 1, point: sender.location(in: self.view), numberOfTouches: sender.numberOfTouches)
    }
    
    func longPress(_ sender: UILongPressGestureRecognizer) {
        gestureProcessor(gestureId: 2, point: sender.location(in: self.view), numberOfTouches: sender.numberOfTouches)
    }
    
    func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        gestureProcessor(gestureId: 3, point: sender.location(in: self.view), numberOfTouches: sender.numberOfTouches)
    }
    
    func swipeRight(_ sender: UISwipeGestureRecognizer) {
        gestureProcessor(gestureId: 4, point: sender.location(in: self.view), numberOfTouches: sender.numberOfTouches)
    }
    
    func swipeUp(_ sender: UISwipeGestureRecognizer) {
        gestureProcessor(gestureId: 5, point: sender.location(in: self.view), numberOfTouches: sender.numberOfTouches)
    }
    
    func swipeDown(_ sender: UISwipeGestureRecognizer) {
        gestureProcessor(gestureId: 6, point: sender.location(in: self.view), numberOfTouches: sender.numberOfTouches)
    }
    
    
    // MARK: Private Methods
    
    private func setupProgressBar() {
        progressBar.barCount = gameCount
    }
    
    private func initializeGestureOptions() {
        for _ in 0..<gameCount {
            gestures += [GestureOption(maxNumberOfTouches: numberOfTouches)]
        }
    }
    
    private func printGestureOptions() {
        print("quadrant gestureId numberOfTouches")
        for i in 0..<gameCount {
            print(String(gestures[i].quadrant) + " " + String(gestures[i].gestureId) + " " + String(gestures[i].numberOfTouches))
        }
    }
    
    private func initializeGestureRecognizers() {
        //0
        if (option >= 0) {
            let singleTapOneTouch = UITapGestureRecognizer(target: self, action: #selector(singleTap(_:)))
            singleTapOneTouch.numberOfTouchesRequired = 1
            singleTapOneTouch.numberOfTapsRequired = 1
            self.view.addGestureRecognizer(singleTapOneTouch)
        }
        
        //1
        if (option >= 1) {
            let doubleTapOneTouch = UITapGestureRecognizer(target: self, action: #selector(doubleTap(_:)))
            doubleTapOneTouch.numberOfTouchesRequired = 1
            doubleTapOneTouch.numberOfTapsRequired = 2
            self.view.addGestureRecognizer(doubleTapOneTouch)
        }
        
        //2
        if (option >= 2) {
            let longPressOneTouch = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
            longPressOneTouch.numberOfTouchesRequired = 1
            longPressOneTouch.minimumPressDuration = 0.5
            self.view.addGestureRecognizer(longPressOneTouch)
        }
        
        //3
        if (option >= 3) {
            let swipeLeftOneTouch = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft(_:)))
            swipeLeftOneTouch.numberOfTouchesRequired = 1
            swipeLeftOneTouch.direction = UISwipeGestureRecognizerDirection.left
            self.view.addGestureRecognizer(swipeLeftOneTouch)
        }
        
        //4
        if (option >= 4) {
            let swipeRightOneTouch = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(_:)))
            swipeRightOneTouch.numberOfTouchesRequired = 1
            swipeRightOneTouch.direction = UISwipeGestureRecognizerDirection.right
            self.view.addGestureRecognizer(swipeRightOneTouch)
        }
        
        
        //5
        if (option >= 5) {
            let swipeUpOneTouch = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp(_:)))
            swipeUpOneTouch.numberOfTouchesRequired = 1
            swipeUpOneTouch.direction = UISwipeGestureRecognizerDirection.up
            self.view.addGestureRecognizer(swipeUpOneTouch)
        }
        
        
        //6
        if (option >= 6) {
            let swipeDownOneTouch = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown(_:)))
            swipeDownOneTouch.numberOfTouchesRequired = 1
            swipeDownOneTouch.direction = UISwipeGestureRecognizerDirection.down
            self.view.addGestureRecognizer(swipeDownOneTouch)
        }
        //7
        
        //8
        
        //9
        
        //10
                
        if (numberOfTouches > 1) {
            initializeGestureRecognizersWithTwoTouch()
        }
        if (numberOfTouches > 2) {
            initializeGestureRecognizersWithThreeTouch()
        }
    }
    
    private func initializeGestureRecognizersWithTwoTouch() {
        //0
        if (option >= 0) {
            let singleTapTwoTouch = UITapGestureRecognizer(target: self, action: #selector(singleTap(_:)))
            singleTapTwoTouch.numberOfTouchesRequired = 2
            singleTapTwoTouch.numberOfTapsRequired = 1
            self.view.addGestureRecognizer(singleTapTwoTouch)
        }
        
        //1
        if (option >= 1) {
            let doubleTapTwoTouch = UITapGestureRecognizer(target: self, action: #selector(doubleTap(_:)))
            doubleTapTwoTouch.numberOfTouchesRequired = 2
            doubleTapTwoTouch.numberOfTapsRequired = 2
            self.view.addGestureRecognizer(doubleTapTwoTouch)
        }
        
        //2
        if (option >= 2) {
            let longPressTwoTouch = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
            longPressTwoTouch.numberOfTouchesRequired = 2
            longPressTwoTouch.minimumPressDuration = 0.5
            self.view.addGestureRecognizer(longPressTwoTouch)
        }
        
        //3
        if (option >= 3) {
            let swipeLeftTwoTouch = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft(_:)))
            swipeLeftTwoTouch.numberOfTouchesRequired = 2
            swipeLeftTwoTouch.direction = UISwipeGestureRecognizerDirection.left
            self.view.addGestureRecognizer(swipeLeftTwoTouch)
        }
        
        //4
        if (option >= 4) {
            let swipeRightTwoTouch = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(_:)))
            swipeRightTwoTouch.numberOfTouchesRequired = 2
            swipeRightTwoTouch.direction = UISwipeGestureRecognizerDirection.right
            self.view.addGestureRecognizer(swipeRightTwoTouch)
        }
        
        //5
        if (option >= 5) {
            let swipeUpTwoTouch = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp(_:)))
            swipeUpTwoTouch.numberOfTouchesRequired = 2
            swipeUpTwoTouch.direction = UISwipeGestureRecognizerDirection.up
            self.view.addGestureRecognizer(swipeUpTwoTouch)
        }
        
        //6
        if (option >= 6) {
            let swipeDownTwoTouch = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown(_:)))
            swipeDownTwoTouch.numberOfTouchesRequired = 2
            swipeDownTwoTouch.direction = UISwipeGestureRecognizerDirection.down
            self.view.addGestureRecognizer(swipeDownTwoTouch)
        }
    }
    
    private func initializeGestureRecognizersWithThreeTouch() {
        //0
        if (option >= 0) {
            let singleTapThreeTouch = UITapGestureRecognizer(target: self, action: #selector(singleTap(_:)))
            singleTapThreeTouch.numberOfTouchesRequired = 3
            singleTapThreeTouch.numberOfTapsRequired = 1
            self.view.addGestureRecognizer(singleTapThreeTouch)
        }
        
        //1
        if (option >= 1) {
            let doubleTapThreeTouch = UITapGestureRecognizer(target: self, action: #selector(doubleTap(_:)))
            doubleTapThreeTouch.numberOfTouchesRequired = 3
            doubleTapThreeTouch.numberOfTapsRequired = 2
            self.view.addGestureRecognizer(doubleTapThreeTouch)
        }
        
        //2
        if (option >= 2) {
            let longPressThreeTouch = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
            longPressThreeTouch.numberOfTouchesRequired = 3
            longPressThreeTouch.minimumPressDuration = 0.5
            self.view.addGestureRecognizer(longPressThreeTouch)
        }
        
        //3
        if (option >= 3) {
            let swipeLeftThreeTouch = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft(_:)))
            swipeLeftThreeTouch.numberOfTouchesRequired = 3
            swipeLeftThreeTouch.direction = UISwipeGestureRecognizerDirection.left
            self.view.addGestureRecognizer(swipeLeftThreeTouch)
        }
        
        //4
        if (option >= 4) {
            let swipeRightThreeTouch = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(_:)))
            swipeRightThreeTouch.numberOfTouchesRequired = 3
            swipeRightThreeTouch.direction = UISwipeGestureRecognizerDirection.right
            self.view.addGestureRecognizer(swipeRightThreeTouch)
        }
        
        //5
        if (option >= 5) {
            let swipeUpThreeTouch = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp(_:)))
            swipeUpThreeTouch.numberOfTouchesRequired = 3
            swipeUpThreeTouch.direction = UISwipeGestureRecognizerDirection.up
            self.view.addGestureRecognizer(swipeUpThreeTouch)
        }
        
        //6
        if (option >= 6) {
            let swipeDownThreeTouch = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown(_:)))
            swipeDownThreeTouch.numberOfTouchesRequired = 3
            swipeDownThreeTouch.direction = UISwipeGestureRecognizerDirection.down
            self.view.addGestureRecognizer(swipeDownThreeTouch)
        }
    }
    
    private func gestureProcessor(gestureId: Int, point: CGPoint, numberOfTouches: Int) {
        
        var currentGestureIndex: Int = progressBar.progress
        
        if (goingBack) {
            currentGestureIndex -= 1
        }
        var currentQuadrant: Int = 0
        if (point.x > self.view.bounds.size.width / 2) {
            currentQuadrant += 1
        }
        if (point.y > self.view.bounds.size.height / 2) {
            currentQuadrant += 2
        }
        
        if (gestures[currentGestureIndex].quadrant != currentQuadrant) {
            incorrect()
        } else if (gestures[currentGestureIndex].numberOfTouches != numberOfTouches) {
            incorrect()
        } else {
        
            switch gestureId {
            case 0:
                print(0)
                correct()
            case 1:
                print(1)
                correct()
            case 2:
                print(2)
                correct()
            case 3:
                print(3)
                correct()
            case 4:
                print(4)
                correct()
            case 5:
                print(5)
                correct()
            case 6:
                print(6)
                correct()
                
            default:
                incorrect()
            }
            
        }
    }
    
    private func correct() {
        print("Correct")
        if (goingBack) {
            progressBar.progress -= 1
        } else {
            progressBar.progress += 1
            if (progressBar.progress >= gameCount) {
                goingBack = true
                progressBar.goingBack = true
            }
        }
        if (goingBack && progressBar.progress == 0) {
            performSegue(withIdentifier: "GameWon", sender: self)
        }
    }
    
    private func incorrect() {
        pointFromScore()
        print("Incorrect")
    }
    
    private func pointFromScore() {
        score -= 1
        scoreBoard.text = String(score)
        if (score == 0) {
            performSegue(withIdentifier: "GameLost", sender: self)
        }
    }
    
}
