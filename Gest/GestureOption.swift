//
//  GestureOption.swift
//  Gest
//
//  Created by Spencer Collins on 5/5/17.
//  Copyright © 2017 Spencer Collins. All rights reserved.
//

import UIKit

class GestureOption: NSObject {

    // MARK: Properties
    var quadrant: Int
    var gestureId: Int
    var numberOfTouches: Int
    
    // MARK: Initialization
    init(maxNumberOfTouches: Int, option: Int) {
        self.quadrant = Int(arc4random_uniform(4))
        let optionsAvailable: Int = option + 1
        self.gestureId = Int(arc4random_uniform(UInt32(optionsAvailable)))
        if (self.gestureId < 7) {
            self.numberOfTouches = Int(arc4random_uniform(UInt32(maxNumberOfTouches))) + 1
        } else {
            self.numberOfTouches = 2
        }
    }
    
}
