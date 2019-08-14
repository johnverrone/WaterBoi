//
//  WaterBoiInterfaceController.swift
//  WaterBoi WatchKit Extension
//
//  Created by John Verrone on 8/14/19.
//  Copyright © 2019 John Verrone. All rights reserved.
//

import WatchKit
import Foundation


class WaterBoiInterfaceController: WKInterfaceController {

    @IBOutlet var currentWaterLabel: WKInterfaceLabel!
    @IBOutlet var progressLabel: WKInterfaceLabel!
    @IBOutlet var waterGoal: WKInterfaceLabel!
    
    var water: Water? {
        didSet {
            guard let water = water else { return }
            print("updated value of water \(water.currentWater) \(water.waterGoal)")
            currentWaterLabel.setText("\(water.currentWater)")
            progressLabel.setText("\(water.progress)")
            waterGoal.setText("\(water.waterGoal)")
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        water = Water(waterGoal: 100)
    }
    
    @IBAction func add8Ounces() {
        print("The value of water is: \(water ?? nil)")
        if let water = water {
            print("water is not nil")
            water.currentWater += 8
        }
        print(water?.currentWater)
    }

    @IBAction func add16Ounces() {
        if let water = water {
            water.currentWater += 16
        }
    }
    
}
