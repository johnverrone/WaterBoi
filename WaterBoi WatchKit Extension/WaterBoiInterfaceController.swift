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
    @IBOutlet var waterGoalLabel: WKInterfaceLabel!
    
    
    var currentWater: Int = 0 {
        didSet {
            currentWaterLabel.setText(String(currentWater))
            let progress = 100 * (Double(currentWater) / Double(waterGoal))
            progressLabel.setText(String(format: "%.0f", progress))
        }
    }
    var waterGoal: Int = 100 {
        didSet {
            waterGoalLabel.setText(String(waterGoal))
            let progress = 100 * (Double(currentWater) / Double(waterGoal))
            progressLabel.setText(String(format: "%.0f", progress))
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        currentWater = 0
        waterGoal = 150
        
        NotificationCenter.default.addObserver(self, selector: #selector(addOunces), name: .didChooseOtherValue, object: nil)
    }
    
    @objc func addOunces(_ notification: Notification) {
        if let data = notification.userInfo as? [String: Int] {
            if let amount = data["amount"] {
                currentWater += amount
            }
        }
        
    }
    
    @IBAction func add8Ounces() {
        currentWater += 8
    }

    @IBAction func add16Ounces() {
        currentWater += 16
    }
    
}

extension Notification.Name {
    static let didChooseOtherValue = Notification.Name("didChooseOtherValue")
}
