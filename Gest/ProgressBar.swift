//
//  ProgressBar.swift
//  Gest
//
//  Created by Spencer Collins on 5/4/17.
//  Copyright © 2017 Spencer Collins. All rights reserved.
//

import UIKit

@IBDesignable class ProgressBar: UIStackView {
    
    // MARK: Properties
    private var progressBars = [UIView]()
    var goingBack: Bool = false
    let scoredColor: UIColor = UIColor.red
    let scoredGoingBackColor: UIColor = UIColor.cyan
    let emptyColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    
    
    var progress = 0 {
        didSet {
            updateBarStates()
        }
    }
    
    @IBInspectable var barSize: CGSize = CGSize(width: 22.0, height: 12.0) {
        didSet {
            setupBars()
        }
    }
    @IBInspectable var barCount: Int = 5 {
        didSet {
            setupBars()
        }
    }
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBars()
        self.distribution = UIStackViewDistribution.fillEqually;
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupBars()
        self.distribution = UIStackViewDistribution.fillEqually;
    }
    
    
    // MARK: Private Methods
    private func setupBars() {
        // Clear any existing views
        for bar in progressBars {
            removeArrangedSubview(bar)
            bar.removeFromSuperview()
        }
        progressBars.removeAll()        
        
        for index in 0..<barCount {
            // Create the button
            let bar = UIView()
            
            bar.backgroundColor = emptyColor
            
            // Add contraints
            bar.translatesAutoresizingMaskIntoConstraints = false
            bar.heightAnchor.constraint(equalToConstant: barSize.height).isActive = true
            
            // Set the accessibility label
            bar.accessibilityLabel = "Score \(index + 1) out of \(barCount)"
            
            // Add the bar to the stack
            addArrangedSubview(bar)
            
            // Add the new bar to the progress bar array
            progressBars.append(bar)
        }
        
        updateBarStates()
    }
    
    private func updateBarStates() {
        
        for (index, bar) in progressBars.enumerated() {
            // If the index of a bar is less that the progress, that bar should be shown.
            if (index < progress) {
                bar.backgroundColor = scoredColor
            } else if (goingBack) {
                bar.backgroundColor = scoredGoingBackColor
            } else {
                bar.backgroundColor = emptyColor
            }
            
            // Set the hint string for the current level of progress
            let hintString: String?
            if progress == index + 1 {
                hintString = "Gesture to score more"
            } else {
                hintString = nil
            }
            
            // Calculate the value string
            let valueString: String
            valueString = "Score of \(progress)."
            
            // Assign the hint string and value string
            bar.accessibilityHint = hintString
            bar.accessibilityValue = valueString
        }
    }
    
}
