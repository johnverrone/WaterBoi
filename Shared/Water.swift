//
//  Water.swift
//  WaterBoi
//
//  Created by John Verrone on 8/14/19.
//  Copyright © 2019 John Verrone. All rights reserved.
//

import WatchKit

class Water {
   
    var currentWater: Int
    var waterGoal: Int
    
    var progress: Int {
        get {
            return currentWater / waterGoal
        }
    }
    
    init(waterGoal: Int) {
        self.currentWater = 0
        self.waterGoal = waterGoal
    }

}
