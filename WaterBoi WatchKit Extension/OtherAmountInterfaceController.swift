//
//  OtherAmountInterfaceController.swift
//  WaterBoi WatchKit Extension
//
//  Created by John Verrone on 8/20/19.
//  Copyright © 2019 John Verrone. All rights reserved.
//

import WatchKit
import Foundation


class OtherAmountInterfaceController: WKInterfaceController {
    
    @IBOutlet var valueLabel: WKInterfaceLabel!
    @IBOutlet var valueSlider: WKInterfaceSlider!
    
    var otherAmount: Int = 0 {
        didSet {
            if otherAmount < 0 || otherAmount > 100 {
                otherAmount = oldValue
            }
            valueLabel.setText("\(otherAmount)")
            valueSlider.setValue(Float(otherAmount))
        }
    }
    
    var crownAccumulator = 0.0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        crownSequencer.delegate = self
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        crownSequencer.focus()
    }

    @IBAction func valueSliderChanged(_ value: Float) {
        otherAmount = Int(value)
    }
    
    @IBAction func done() {
        NotificationCenter.default.post(name: .didChooseOtherValue, object: self, userInfo: ["amount": otherAmount])
        
        dismiss()
    }
}

extension OtherAmountInterfaceController: WKCrownDelegate {
    func crownDidRotate(_ crownSequencer: WKCrownSequencer?, rotationalDelta: Double) {
        print(rotationalDelta)
        
        crownAccumulator += rotationalDelta
        
        if crownAccumulator > 0.1 {
            otherAmount += 1
            crownAccumulator = 0.0
        } else if crownAccumulator < -0.1 {
            otherAmount -= 1
            crownAccumulator = 0.0
        }
    }
}
